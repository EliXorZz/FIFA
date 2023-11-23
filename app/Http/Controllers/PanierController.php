<?php

namespace App\Http\Controllers;

use App\Http\Requests\DeleteProduitPanierRequest;
use App\Http\Requests\UpdateProduitPanierRequest;
use App\Panier;
use Illuminate\Http\Request;

class PanierController extends Controller
{
    function index(Panier $panier) {
        $produits = $panier->getProduits();

        $produits = $produits
            ->with('images')
            ->get();

        return view('panier', [
            'produits' => $produits,
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
}
