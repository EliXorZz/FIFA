<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateProduitPanierRequest;
use App\Http\Requests\UpdateProduitQuantityPanierRequest;
use App\Panier;
use Illuminate\Http\Request;

class PanierController extends Controller
{
    function index(Panier $panier) {
        $produits = $panier->getProduits();

        if (!empty($produits))
            $produits = $produits
                ->with('images')
                ->get();

        return view('panier', [
            'produits' => $produits,
        ]);
    }

    function addNotify(UpdateProduitPanierRequest $request, Panier $panier) {
        return $this->add($request, $panier)
            ->with('notification', [
                'title' => 'Mise à jour panier',
                'description' => 'Vous avez ajouté cette article au panier.'
            ]);
    }

    function add(UpdateProduitPanierRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->addProduit(
            $validated['selectVariante'],
            $validated['selectTaille']
        );

        return back();
    }

    function remove(UpdateProduitPanierRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->removeProduit(
            $validated['selectVariante'],
            $validated['selectTaille']
        );

        return back();
    }

    function delete(UpdateProduitPanierRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->deleteProduit(
            $validated['selectVariante'],
            $validated['selectTaille']
        );

        return back();
    }

    function update(UpdateProduitQuantityPanierRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->updateQuantity(
            $validated['idvariantecouleurproduit'],
            $validated['idtailleproduit'],
            $validated['quantity']
        );

        return back();
    }
}
