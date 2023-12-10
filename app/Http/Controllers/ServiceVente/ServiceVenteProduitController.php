<?php

namespace App\Http\Controllers\ServiceVente;

use App\Http\Controllers\Controller;
use App\Http\Requests\ServiceVenteProduitRequest;
use App\Http\Requests\ServiceVenteProduitsRequest;
use App\Models\CategorieProduit;
use App\Models\Couleur;
use App\Models\Produit;
use App\Models\TailleProduit;
use Illuminate\Http\Request;

class ServiceVenteProduitController extends Controller
{
    function index(ServiceVenteProduitsRequest $request) {
        $validated = $request->validated();

        $produits = Produit::with(['variantes.couleur', 'tailles'])
            ->orderBy('idproduit');

        if (isset($validated['search'])) {
            $keywords = explode(',', $validated['search']);

            $produits->where(function($query) use($keywords) {
                foreach ($keywords as $keyword) {
                    $query->where('produit.titreproduit', 'ILIKE', "%$keyword%");
                }
            });
        }

        $produits = $produits->simplePaginate(10);

        return view('service-vente.produits.index', [
            'produits' => $produits
        ]);
    }

    function create() {
        $categories = CategorieProduit::orderBy('idcategorieproduit')
            ->get();

        $tailles = TailleProduit::orderBy('idtailleproduit')
            ->get();

        return view('service-vente.produits.create', [
            'categories' => $categories,
            'tailles' => $tailles
        ]);
    }

    function show(Produit $produit) {
        $produit
            ->load(['categories', 'variantes.images', 'variantes.couleur']);

        $variantes = $produit->variantes
            ->sortBy('idcouleur');

        $categories = CategorieProduit::orderBy('idcategorieproduit')
            ->get();

        $tailles = TailleProduit::orderBy('idtailleproduit')
            ->get();

        $couleurs = Couleur::orderBy('idcouleur')
            ->get();

        return view('service-vente.produits.show', [
            'produit' => $produit,
            'variantes'=> $variantes,

            'categories' => $categories,
            'tailles' => $tailles,

            'couleurs' => $couleurs,
        ]);
    }

    function store(ServiceVenteProduitRequest $request) {
        $validated = $request->validated();

        $produit = Produit::create($validated);

        $categories = $validated['categories'] ?? [];
        $tailles = $validated['tailles'] ?? [];

        $produit->categories()->sync($categories, true);
        $produit->tailles()->sync($tailles, true);

        return redirect()->route('service-vente.produits.show', [
            'produit' => $produit
        ])->with('notification', 'Votre produit à bien été créé !');
    }

    function update(ServiceVenteProduitRequest $request, Produit $produit) {
        $validated = $request->validated();

        $categories = $validated['categories'] ?? [];
        $tailles = $validated['tailles'] ?? [];

        $produit->categories()->sync($categories, true);
        $produit->tailles()->sync($tailles, true);

        $produit->update($validated);

        return redirect()->route('service-vente.produits.show', [
            'produit' => $produit
        ]);
    }
}
