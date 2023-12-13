<?php

namespace App;

use App\Models\Produit;
use App\Models\VarianteCouleurProduit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class Historique {
    function addVarianteVisite(int $idVariante) {
        $cookie = Cookie::get('variante_visites');
        $cookie = $cookie ? unserialize($cookie) : [];

        if (!in_array($idVariante, $cookie)) {
            $cookie[] = $idVariante;
            Cookie::queue('variante_visites', serialize($cookie));
        }
    }

    function getVarianteVisites() {
        $cookie = Cookie::get('variante_visites');
        $cookie = $cookie ? unserialize($cookie) : [];

        $query = VarianteCouleurProduit::with(['produit', 'images']);

        foreach ($cookie as $value) {
            $query->orWhere(function($query) use($value) {
                $query
                    ->where('variantecouleurproduit.idvariantecouleurproduit', '=', $value);
            });
        }

        return $query;
    }
}


