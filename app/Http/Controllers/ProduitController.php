<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProduitsRequest;
use App\Models\Produit;
use Illuminate\Http\Request;

class ProduitController extends Controller
{
    function index(ProduitsRequest $request) {
        $validated = $request->validated();

        $produits = Produit::select(['produit.idproduit', 'variantecouleurproduit.idcouleur', 'titreproduit', 'prix'])
            ->join('variantecouleurproduit', 'variantecouleurproduit.idproduit', '=', 'produit.idproduit')
            ->join('produitcontienttaille', 'produitcontienttaille.idproduit', '=', 'produit.idproduit')
            ->distinct();

        if (isset($validated['nation'])) {
            $produits = $produits->where('idnation', '=', $validated['nation']);
        }

        if(isset($validated['categorie'])) {
            $produits = $produits->where('idcategorieproduit', '=', $validated['categorie']);
        }

        $couleurList = (clone $produits)
            ->select(['couleur.idcouleur', 'nomcouleur'])
            ->join('couleur', 'couleur.idcouleur', '=', 'variantecouleurproduit.idcouleur')
            ->orderBy('couleur.idcouleur', 'asc')
            ->get();

        $tailleList = (clone $produits)
            ->select(['tailleproduit.idtailleproduit', 'nomtailleproduit'])
            ->join('tailleproduit', 'tailleproduit.idtailleproduit', '=', 'produitcontienttaille.idtailleproduit')
            ->orderBy('tailleproduit.idtailleproduit', 'asc')
            ->get();

        $couleurs = collect();
        if (isset($validated['couleurs'])) {
            $couleurs = collect(explode(',', $validated['couleurs']));

            $produits = $produits->where(function($query) use($couleurs) {
                foreach ($couleurs as $couleur) {
                    $query->orWhere('variantecouleurproduit.idcouleur', '=', $couleur);
                }
            });
        }

        $tailles = collect();
        if (isset($validated['tailles'])) {
            $tailles = collect(explode(',', $validated['tailles']));

            $produits = $produits->where(function($query) use($tailles) {
                foreach ($tailles as $taille) {
                    $query->orWhere('produitcontienttaille.idtailleproduit', '=', $taille);
                }
            });
        }

        if (isset($validated['order'])) {
            $produits = $produits->orderBy('prix', $validated['order']);
        }

        $produits = $produits
            ->with('images')
            ->get();

        return view('produits', [
            'produits' => $produits,

            'couleurs' => $couleurList,
            'tailles' => $tailleList,

            'filtre_couleurs' => $couleurs,
            'filtre_tailles' => $tailles
        ]);
    }

    function show(Produit $produit) {
        $tailles = $produit->tailles()->get();
        $variantes = $produit->variantes()->get();
        $images = $produit->images()->get();

        $produitsSimilaires = $produit->produitsSimilaires()
            ->select(['produit.idproduit', 'variantecouleurproduit.idcouleur', 'titreproduit', 'prix'])
            ->join('variantecouleurproduit', 'variantecouleurproduit.idproduit', '=', 'produit.idproduit')
            ->with('images')
            ->get();

        return view('produit', [
            'produit' => $produit,

            'tailles' => $tailles,
            'variantes' => $variantes,
            'images' => $images,

            'produitsSimilaires' => $produitsSimilaires
        ]);
    }
}
