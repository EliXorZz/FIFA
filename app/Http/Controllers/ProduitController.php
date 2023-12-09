<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProduitRequest;
use App\Http\Requests\ProduitsRequest;
use App\Models\TailleProduit;
use App\Models\VarianteCouleurProduit;
use Illuminate\Http\Request;

class ProduitController extends Controller
{
    function index(ProduitsRequest $request) {
        $validated = $request->validated();

        $variantes = VarianteCouleurProduit::select(['produit.idproduit', 'variantecouleurproduit.idvariantecouleurproduit', 'variantecouleurproduit.idcouleur', 'titreproduit', 'prix'])
            ->join('produit', 'produit.idproduit', '=', 'variantecouleurproduit.idproduit')
            ->join('categoriecontientproduit', 'categoriecontientproduit.idproduit', '=', 'produit.idproduit')
            ->join('produitcontienttaille', 'produitcontienttaille.idproduit', '=', 'produit.idproduit')
            ->distinct();

        if (isset($validated['nation'])) {
            $variantes->where('idnation', '=', $validated['nation']);
        }

        if(isset($validated['categorie'])) {
            $variantes->where('idcategorieproduit', '=', $validated['categorie']);
        }

        if (isset($validated['search'])) {
            $keywords = explode(',', $validated['search']);

            $variantes->where(function($query) use($keywords) {
                foreach ($keywords as $keyword) {
                    $query->where('produit.titreproduit', 'ILIKE', "%$keyword%");
                }
            });
        }

        $couleurList = (clone $variantes)
            ->select(['couleur.idcouleur', 'nomcouleur'])
            ->join('couleur', 'couleur.idcouleur', '=', 'variantecouleurproduit.idcouleur')
            ->orderBy('couleur.idcouleur', 'asc')
            ->get();

        $tailleList = (clone $variantes)
            ->select(['tailleproduit.idtailleproduit', 'nomtailleproduit'])
            ->join('tailleproduit', 'tailleproduit.idtailleproduit', '=', 'produitcontienttaille.idtailleproduit')
            ->orderBy('tailleproduit.idtailleproduit', 'asc')
            ->get();

        $couleurs = collect();
        if (isset($validated['couleurs'])) {
            $couleurs = collect(explode(',', $validated['couleurs']));
            $variantes->whereIn('variantecouleurproduit.idcouleur', $couleurs);
        }

        $tailles = collect();
        if (isset($validated['tailles'])) {
            $tailles = collect(explode(',', $validated['tailles']));
            $variantes->whereIn('produitcontienttaille.idtailleproduit', $tailles);
        }

        if (isset($validated['order'])) {
            $variantes->orderBy('prix', $validated['order']);
        }

        $variantes = $variantes
            ->with('images')
            ->get();

        return view('produits', [
            'variantes' => $variantes,

            'couleurs' => $couleurList,
            'tailles' => $tailleList,

            'filtre_couleurs' => $couleurs,
            'filtre_tailles' => $tailles,
        ]);
    }

    function show(ProduitRequest $request, VarianteCouleurProduit $variantecouleurproduit) {
        $validated = $request->validated();

        $selectVariante = $variantecouleurproduit
            ->load(['produit.variantes.couleur' , 'produit.tailles', 'couleur']);

        $produit = $selectVariante->produit;

        $images = $selectVariante->images;
        $tailles = $produit->tailles;
        $variantes = $produit->variantes;

        $selectTaille = isset($validated['selectTaille'])
            ? TailleProduit::find($validated['selectTaille'])
            : $tailles->first();

        $produitsSimilaires = $produit->produitsSimilaires()
            ->with('images')
            ->get();

        $produitsSimilaires = collect();

        return view('produit', [
            'produit' => $produit,

            'images' => $images,
            'tailles' => $tailles,
            'variantes' => $variantes,

            'selectVariante' => $selectVariante,
            'selectTaille' => $selectTaille,

            'produitsSimilaires' => $produitsSimilaires
        ]);
    }
}
