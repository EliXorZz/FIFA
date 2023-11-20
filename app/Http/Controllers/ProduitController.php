<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProduitsRequest;
use App\Models\CategorieProduit;
use App\Models\Nation;
use App\Models\Produit;

class ProduitController extends Controller
{
    function index(ProduitsRequest $request) {
        $validated = $request->validated();

        $produits = Produit::select(['produit.idproduit', 'produitcontienttaille.idtailleproduit', 'variantecouleurproduit.idcouleur', 'titreproduit', 'prix'])
            ->join('variantecouleurproduit', 'variantecouleurproduit.idproduit', '=', 'produit.idproduit')
            ->join('produitcontienttaille', 'produitcontienttaille.idproduit', '=', 'produit.idproduit');

        if (isset($validated['nation'])) {
            $produits = $produits->where('idnation', '=', $validated['nation']);
        }

        if(isset($validated['categorie'])) {
            $produits = $produits->where('idcategorieproduit', '=', $validated['categorie']);
        }

        $couleurList = (clone $produits)
            ->select(['couleur.idcouleur', 'nomcouleur'])
            ->distinct()
            ->join('couleur', 'couleur.idcouleur', '=', 'variantecouleurproduit.idcouleur')
            ->get();

        $tailleList = (clone $produits)
            ->select(['tailleproduit.idtailleproduit', 'nomtailleproduit'])
            ->distinct()
            ->join('tailleproduit', 'tailleproduit.idtailleproduit', '=', 'produitcontienttaille.idtailleproduit')
            ->get();

        $couleurs = collect();
        if (isset($validated['couleurs'])) {
            $couleurs = explode(',', $validated['couleurs']);

            $produits = $produits->where(function($query) use($couleurs) {
                foreach ($couleurs as $couleur) {
                    $query->orWhere('variantecouleurproduit.idcouleur', '=', $couleur);
                }
            });
        }

        $tailles = collect();
        if (isset($validated['tailles'])) {
            $tailles = explode(',', $validated['tailles']);

            $produits = $produits->where(function($query) use($tailles) {
                foreach ($tailles as $taille) {
                    $query->orWhere('produitcontienttaille.idtailleproduit', '=', $taille);
                }
            });
        }

        if (isset($validated['order'])) {
            $produits = $produits->orderBy('prix', $validated['order']);
        }

        $produits = $produits->get();

        return view('produits', [
            'produits' => $produits,

            'couleurs' => $couleurList,
            'tailles' => $tailleList,

            'filtre_couleurs' => $couleurs,
            'filtre_tailles' => $tailles
        ]);
    }
}
