<?php

namespace App\Http\Controllers;

use App\Http\Requests\StripeRequest;
use App\Models\TypeLivraison;
use App\Models\Utilisateur;
use App\Panier;
use Illuminate\Http\Request;
use Stripe\Checkout\Session;
use Stripe\TaxRate;
use Stripe\Webhook;

class CommandeController extends Controller
{
    function doCommande(Request $request, Panier $panier) {
        if ($panier->isEmpty()) {
            return back();
        }

        $utilisateur = $request->user();

        $typeslivraison = TypeLivraison::all();
        $produits = $panier->getProduits()->get();

        $stripeid = $utilisateur->stripeid;

        $data = [
            'mode' => 'payment',
            'success_url' => route('commandeSuccess').'?session={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('welcome'),

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

            'line_items' => [
                $produits->map(fn ($produit) => [
                    'quantity' => $panier->getQuantity($produit->idproduit, $produit->idtailleproduit, $produit->idcouleur),

                    'price_data' => [
                        'currency' => 'EUR',
                        'unit_amount' => $produit->prix * 100,

                        'product_data' => [
                            'name' => $produit->titreproduit,
                            'description' => "$produit->nomtailleproduit $produit->nomcouleur",

                            'metadata' => [
                                'idproduit' => $produit->idproduit,
                                'idtailleproduit' => $produit->idtailleproduit,
                                'idcouleur' => $produit->idcouleur
                            ]
                        ]
                    ],
                ])->toArray()
            ]
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
        $session = Session::retrieve($data['id']);

        $stripeid = $session['customer'];
        $idutilisateur = $session['client_reference_id'];

        $utilisateur = Utilisateur::find($idutilisateur);
        $utilisateur->stripeid = $stripeid;

        $utilisateur->save();
    }
}
