<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProduitRequest;
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

        if (isset($validated['search'])) {
            $keywords = explode(',', $validated['search']);

            $produits = $produits->where(function($query) use($keywords) {
                foreach ($keywords as $keyword) {
                    $query->where('produit.titreproduit', 'ILIKE', "%$keyword%");
                }
            });
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
            $produits = $produits->whereIn('variantecouleurproduit.idcouleur', $couleurs);
        }

        $tailles = collect();
        if (isset($validated['tailles'])) {
            $tailles = collect(explode(',', $validated['tailles']));
            $produits = $produits->whereIn('produitcontienttaille.idtailleproduit', $tailles);
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
            'filtre_tailles' => $tailles,
        ]);
    }

    function show(ProduitRequest $request, Produit $produit) {
        $validated = $request->validated();

        $images = $produit->images()->get();

        $tailles = $produit->tailles()->orderBy('idtailleproduit')->get();
        $variantes = $produit->variantes()->get();

        $selectTaille = isset($validated['selectTaille'])
            ? $tailles->where('idtailleproduit', $validated['selectTaille'])->first()
            : $tailles->first();

        $selectCouleur = isset($validated['selectCouleur'])
            ? $variantes->where('idcouleur', $validated['selectCouleur'])->first()
            : $variantes->first();

        $produitsSimilaires = $produit->produitsSimilaires()
            ->select(['produit.idproduit', 'variantecouleurproduit.idcouleur', 'titreproduit', 'prix'])
            ->join('variantecouleurproduit', 'variantecouleurproduit.idproduit', '=', 'produit.idproduit')
            ->with('images')
            ->get();

        return view('produit', [
            'produit' => $produit,

            'images' => $images,
            'tailles' => $tailles,
            'variantes' => $variantes,

            'selectTaille' => $selectTaille,
            'selectCouleur' => $selectCouleur,

            'produitsSimilaires' => $produitsSimilaires
        ]);
    }
}
