<?php

namespace App\Http\Controllers\ServiceVente;

use App\Http\Controllers\Controller;
use App\Http\Requests\ServiceVenteVarianteRequest;
use App\Models\ImageProduit;
use App\Models\Produit;
use App\Models\VarianteCouleurProduit;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;

class ServiceVenteVarianteController extends Controller
{
    function store(Produit $produit, ServiceVenteVarianteRequest $request) {
        $validated = $request->validated();

        $validated['idproduit'] = $produit->idproduit;
        $variante = VarianteCouleurProduit::create($validated);

        $images = $validated['images'] ?? [];
        foreach ($images as $file) {
            $path = $file->store('/produits', 'public');
            $path = "storage/$path";

            $image = new ImageProduit();

            $image->urlimageproduit = $path;
            $image->save();

            $variante->images()->attach($image->idimageproduit);
        }

        return back();
    }

    function update(Produit $produit, VarianteCouleurProduit $variante, ServiceVenteVarianteRequest $request) {
        $validated = $request->validated();

        $variante->update($validated);

        $images = $validated['images'] ?? [];
        foreach ($images as $file) {
            $path = $file->store('/produits', 'public');
            $path = "storage/$path";

            $image = new ImageProduit();

            $image->urlimageproduit = $path;
            $image->save();

            $variante->images()->attach($image->idimageproduit);
        }

        return back();
    }

    function destroy(int $produit, int $variante) {
        $variante = VarianteCouleurProduit::find($variante);

        try {
            $variante->delete();
        }catch (Exception $e) {
            throw ValidationException::withMessages([
                'message' => 'La variante est lié à une commande et ne peux pas être supprimé.'
            ]);
        }

        return back();
    }

    function deleteImage(int $imageproduit) {
        $imageproduit = ImageProduit::find($imageproduit);

        $path = $imageproduit->urlimageproduit;
        Storage::delete($path);

        $imageproduit->variantes()->detach();
        $imageproduit->delete();

        return back();
    }
}
