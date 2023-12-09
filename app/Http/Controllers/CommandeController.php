<?php

namespace App\Http\Controllers;

use App\Http\Requests\StripeRequest;
use App\Models\Commande;
use App\Models\LigneCommande;
use App\Models\TypeLivraison;
use App\Models\Utilisateur;
use App\Panier;
use Illuminate\Http\Request;
use Stripe\Checkout\Session;
use Stripe\Webhook;

class CommandeController extends Controller
{
    function doCommande(Request $request, Panier $panier) {
        if ($panier->isEmpty()) {
            return back();
        }

        $utilisateur = $request->user();

        $typeslivraison = TypeLivraison::all();
        $produits = $panier->getProduits()
            ->with('images')
            ->get();

        $stripeid = $utilisateur->stripeid;

        $data = [
            'mode' => 'payment',
            'success_url' => route('commandeClear').'?session={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('panier'),

            'invoice_creation' => [
                'enabled' => true
            ],

            'payment_intent_data' => [
                'setup_future_usage' => 'on_session'
            ],

            'automatic_tax' => [
                'enabled' => true
            ],

            'phone_number_collection' => [
                'enabled' => true
            ],

            'billing_address_collection' => 'required',
            'shipping_address_collection' => [
                'allowed_countries' => ['FR']
            ],

            'client_reference_id' => $utilisateur->idutilisateur,

            'shipping_options' => $typeslivraison->map(fn ($typelivraison) => [
                'shipping_rate_data' => [
                    'display_name' => $typelivraison->nomlivraison,

                    'delivery_estimate' => [
                        'maximum' => [
                            'unit' => 'business_day',
                            'value' => $typelivraison->maxbusinessdays
                        ]
                    ],

                    'fixed_amount' => [
                        'amount' => $typelivraison->prixlivraison * 100,
                        'currency' => 'EUR'
                    ],

                    'type' => 'fixed_amount',

                    'metadata' => [
                        'idtypelivraison' => $typelivraison->idtypelivraison
                    ]
                ]
            ])->toArray(),

            'line_items' => $produits->map(fn ($produit) => [
                'quantity' => $panier->getQuantity($produit->idvariantecouleurproduit, $produit->idtailleproduit),

                'price_data' => [
                    'currency' => 'EUR',
                    'unit_amount' => $produit->prix * 100,

                    'product_data' => [
                        'name' => $produit->titreproduit,
                        'description' => "$produit->nomtailleproduit $produit->nomcouleur",

                        'images' => [ asset($produit->images->first()->urlimageproduit) ],

                        'metadata' => [
                            'idvariantecouleurproduit' => $produit->idvariantecouleurproduit,
                            'idtailleproduit' => $produit->idtailleproduit
                        ]
                    ]
                ],
            ])->toArray()
        ];

        if (isset($stripeid)) {
            $data['customer_update'] = [
                'shipping' => 'auto'
            ];

            $data['customer'] = $stripeid;
        }else {
            $data['customer_creation'] = 'always';
            $data['customer_email'] = $utilisateur->mailutilisateur;
        }

        $session = Session::create($data);
        $url = $session->url;

        $utilisateur->stripeid = $session->customer;
        $utilisateur->save();

        return redirect($url);
    }

    function clear(StripeRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->clear();

        return redirect()->route('commandeSuccess', $validated);
    }

    function success(StripeRequest $request, Panier $panier) {
        return view('stripe.success');
    }

    function event(Request $request) {
        $secret = env('STRIPE_WEBHOOK_SECRET');

        $signature = $request->header('stripe-signature');
        $body = $request->getContent();

        $event = Webhook::constructEvent($body, $signature, $secret);

        $type = $event->type;
        $data = $event->data['object'];

        if ($type == 'checkout.session.completed') {
            $this->sessionCompletedEvent($data);
        }

        return;
    }

    function sessionCompletedEvent($data) {
        $session = Session::retrieve([
            'id' => $data['id'],
            'expand' => ['shipping_cost.shipping_rate', 'line_items.data.price.product', 'invoice']
        ]);

        $stripeid = $session['customer'];

        $idutilisateur = $session['client_reference_id'];
        $phone = $session['customer_details']['phone'];

        $utilisateur = Utilisateur::find($idutilisateur);

        $utilisateur->stripeid = $stripeid;
        $utilisateur->phoneutilisateur = $phone;

        $utilisateur->save();

        $facture = $session['invoice']['invoice_pdf'];

        $prixlivraison = $session['shipping_cost'];
        $idtypelivraison = $prixlivraison['shipping_rate']['metadata']['idtypelivraison'];

        $adresselivraison = $session['shipping_details']['address'];
        $adressefacturation = $session['customer_details']['address'];

        //---------------------------------------------------//

        $commande = new Commande();

        $commande->idtypelivraison = $idtypelivraison;
        $commande->idutilisateur = $idutilisateur;

        $commande->villelivraisoncmd = $adresselivraison['city'];
        $commande->ruelivraisoncmd = $adresselivraison['line1'];
        $commande->postallivraisoncmd = $adresselivraison['postal_code'];

        $commande->villefacturationcmd = $adressefacturation['city'];
        $commande->ruefacturationcmd = $adressefacturation['line1'];
        $commande->postalfacturationcmd = $adressefacturation['postal_code'];

        $commande->prixlivraisoncmd = $prixlivraison['amount_subtotal'] / 100;

        $commande->tvacmd = 0.2;
        $commande->expeditioncmd = false;

        $commande->facturecmd = $facture;

        $commande->save();

        $lignescommande = $session['line_items']['data'];

        foreach ($lignescommande as $lignecommande) {
            $quantite = $lignecommande['quantity'];
            $prix = $lignecommande['price'];

            $produit = $prix['product']['metadata'];

            $ligne = new LigneCommande();

            $ligne->idvariantecouleurproduit = $produit['idvariantecouleurproduit'];
            $ligne->idtailleproduit = $produit['idtailleproduit'];
            $ligne->idcommande = $commande->idcommande;

            $ligne->quantitecommande = $quantite;
            $ligne->prixunitaire = $prix['unit_amount'] / 100;

            $ligne->save();
        }
    }
}
