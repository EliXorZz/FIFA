<?php

namespace App\Http\Controllers\ServiceVente;

use App\Http\Controllers\Controller;
use App\Http\Requests\ServiceVenteCategorieRequest;
use App\Http\Requests\ServiceVenteCategoriesRequest;
use App\Models\CategorieProduit;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class ServiceVenteCategorieController extends Controller
{
    function index(ServiceVenteCategoriesRequest $request) {
        $validated = $request->validated();

        $categories = CategorieProduit::with(['parents', 'produits'])
            ->orderBy('idcategorieproduit');

        if (isset($validated['search'])) {
            $keywords = explode(',', $validated['search']);

            $categories->where(function($query) use($keywords) {
                foreach ($keywords as $keyword) {
                    $keyword = Str::lower($keyword);
                    $query->where(DB::raw('LOWER(categorieproduit.nomcategorieproduit)'), 'LIKE', "%$keyword%");
                }
            });
        }

        $categories = $categories->simplePaginate(10);

        return view('service-vente.categories.index', [
            'categories' => $categories
        ]);
    }

    function show(CategorieProduit $category) {
        $parents = CategorieProduit::where('parentcategorieproduit', true)
            ->orderBy('idcategorieproduit')
            ->get();

        return view('service-vente.categories.show', [
            'categorie' => $category,
            'parents' => $parents
        ]);
    }

    function create() {
        $parents = CategorieProduit::where('parentcategorieproduit', true)
            ->orderBy('idcategorieproduit')
            ->get();

        return view('service-vente.categories.create', [
            'parents' => $parents
        ]);
    }

    function store(ServiceVenteCategorieRequest $request) {
        $validated = $request->validated();

        $categorie = CategorieProduit::create($validated);

        if (isset($validated['idcategorieproduit'])) {
            $parentCategorie = $validated['idcategorieproduit'];
            $categorie->parents()->attach($parentCategorie);
        }

        return redirect()->route('service-vente.categories.show', [
            'category' => $categorie
        ])->with('notification', 'Votre catégorie à bien été créé !');
    }

    function destroy(Request $request, int $category) {
        $categorie = CategorieProduit::find($category);

        if ($categorie->sousCategories()->exists()) {
            return redirect()
                ->route('service-vente.categories.index')
                ->withErrors([
                    'message' => 'Supression impossible, cette catégorie comporte des sous-categories !'
                ]);
        }

        $categorie->parents()->detach();
        $categorie->produits()->detach();

        $categorie->delete();

        return redirect()->route('service-vente.categories.index');
    }
}
