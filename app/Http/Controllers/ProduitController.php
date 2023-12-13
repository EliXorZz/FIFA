<?php

namespace App\Http\Controllers;

use App\Historique;
use App\Http\Requests\ProduitRequest;
use App\Http\Requests\ProduitsRequest;
use App\Models\TailleProduit;
use App\Models\VarianteCouleurProduit;
use App\Panier;
use Illuminate\Http\Request;

class ProduitController extends Controller
{
    function index(ProduitsRequest $request) {
        $validated = $request->validated();

        $variantes = VarianteCouleurProduit::select(['produit.idproduit', 'variantecouleurproduit.idvariantecouleurproduit', 'variantecouleurproduit.idcouleur', 'titreproduit', 'prix'])
            ->join('produit', 'produit.idproduit', '=', 'variantecouleurproduit.idproduit')
            ->join('categoriecontientproduit', 'categoriecontientproduit.idproduit', '=', 'produit.idproduit')
            ->join('produitcontienttaille', 'produitcontienttaille.idproduit', '=', 'produit.idproduit')
            ->whereNotNull('prix')
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

    function show(ProduitRequest $request, VarianteCouleurProduit $variantecouleurproduit, Historique $historique) {
        $validated = $request->validated();

        abort_if($variantecouleurproduit->prix == null, 404);

        $selectVariante = $variantecouleurproduit
            ->load(['produit.produitsSimilaires.variantes.images', 'produit.variantes.couleur' , 'produit.tailles', 'couleur']);

        $produit = $selectVariante->produit;

        $images = $selectVariante->images;
        $tailles = $produit->tailles;
        $variantes = $produit->variantes;

        $selectTaille = isset($validated['selectTaille'])
            ? TailleProduit::find($validated['selectTaille'])
            : $tailles->first();

        $produitsSimilaires = $produit->produitsSimilaires;


        $historique->addVarianteVisite($selectVariante->idvariantecouleurproduit);
        $varianteVisites = $historique->getVarianteVisites()
            ->get();

        return view('produit', [
            'produit' => $produit,

            'images' => $images,
            'tailles' => $tailles,
            'variantes' => $variantes,

            'selectVariante' => $selectVariante,
            'selectTaille' => $selectTaille,

            'produitsSimilaires' => $produitsSimilaires,

            'varianteVisites' => $varianteVisites
        ]);
    }
}
