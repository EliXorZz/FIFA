<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Panier;

class PanierController extends Controller
{
    public function show(){
        return view("panier");
    }

    public function addPanier(Request $request, Panier $panier){
        $couleur = $request->input("selectCouleur");
        $taille = $request->input("selectTaille");
        $produit = $request->input("selectProduit");

        $panier->addProduit($produit, $taille, $couleur);

        return redirect()->back()->with('notification', [
            'title' => "Panier",
            'description' => "Le Produit à bien était ajouté au panier"
        ]);
    }

    public function add1Panier(Request $request, Panier $panier){
        $couleur = $request->input("couleur");
        $taille = $request->input("taille");
        $produit = $request->input("produit");

        $panier->add1Produit($produit, $taille, $couleur);

        return redirect()->route('Panier');


    }

    public function removePanier(Request $request, Panier $panier){
        $couleur = $request->input("couleur");
        $taille = $request->input("taille");
        $produit = $request->input("produit");

        $panier->removeProduit($produit, $taille, $couleur);

        return redirect()->route('Panier');
    }


    public function remove1Panier(Request $request, Panier $panier){
        $couleur = $request->input("couleur");
        $taille = $request->input("taille");
        $produit = $request->input("produit");

        $panier->remove1Produit($produit, $taille, $couleur);

        return redirect()->route('Panier');
    }

    public function updateQuantite(Request $request, Panier $panier)
    {
        $produit = $request->input("produit");

        $couleur = $request->input("couleur");
        $taille = $request->input("taille");

        $quantite = $request->input("quantite");

        $panier->updateQuantite($produit, $taille, $couleur, $quantite);

        return redirect()->route('Panier');
    }
}
