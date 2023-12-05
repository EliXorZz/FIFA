<?php

namespace App\Http\Controllers;

use App\Panier;
use Illuminate\Http\Request;
use Stripe\Checkout\Session;
use Stripe\Stripe;

class StripeController extends Controller
{
    public function checkout()
    {
        return redirect()->route('panier');
    }

    public function session(Panier $panier)
    {
        $produits = $panier->getProduits()->get()->toArray();

        $lignescommande = array_map(function ($produit) use($panier) {
            return [
                'price_data' => [
                    'currency' => 'EUR',
                    'product_data' => [
                        'name' => $produit['titreproduit'],
                    ],
                    'unit_amount' => $produit['prix'] * 100,
                ],
                'quantity' => $panier->getQuantity($produit['idproduit'], $produit['idtailleproduit'], $produit['idcouleur'])
            ];
        }, $produits);

        Stripe::setApiKey(config('stripe.sk'));
        $session = Session::create([
            'line_items'  => $lignescommande,
            'mode'        => 'payment',
            'success_url' => route('success').'?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url'  => route('checkout'),
            'shipping_address_collection' => [
                'allowed_countries' => ['FR']
            ],
            'customer_creation' => 'always',
            'payment_intent_data' => [
                'setup_future_usage' => 'on_session'
            ]
        ]);

        return redirect()->away($session->url);
    
    }

    public function success(Request $request)
    { 
        Stripe::setApiKey(config('stripe.sk'));

        $id = $request->query('session_id');

        dd(Session::retrieve($id)['customer']);
    }

}