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
            $validated['selectProduit'],
            $validated['selectTaille'],
            $validated['selectCouleur']
        );

        return back();
    }

    function remove(UpdateProduitPanierRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->removeProduit(
            $validated['selectProduit'],
            $validated['selectTaille'],
            $validated['selectCouleur']
        );

        return back();
    }

    function delete(UpdateProduitPanierRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->deleteProduit(
            $validated['selectProduit'],
            $validated['selectTaille'],
            $validated['selectCouleur']
        );

        return back();
    }

    function update(UpdateProduitQuantityPanierRequest $request, Panier $panier) {
        $validated = $request->validated();

        $panier->updateQuantity(
            $validated['idproduit'],
            $validated['idtailleproduit'],
            $validated['idcouleur'],
            $validated['quantity']
        );

        return back();
    }
}
