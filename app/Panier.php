<?php

namespace App;

use App\Models\VarianteCouleurProduit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class Panier {
    function addProduit(int $idVarianteCouleurProduit, int $idTailleProduit) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idVarianteCouleurProduit. '_' .$idTailleProduit;

        if (isset($cookie[$id])) {
            $quantite = $cookie[$id]['quantite'];
            $cookie[$id]['quantite'] = $quantite + 1;
        }else {
            $cookie[$id] = [
                "idvariantecouleurproduit" => $idVarianteCouleurProduit,
                "idtailleproduit" => $idTailleProduit,
                "quantite" => 1
            ];
        }

        Cookie::queue('panier', serialize($cookie));
    }

    function removeProduit(int $idVarianteCouleurProduit, int $idTailleProduit) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idVarianteCouleurProduit. '_' .$idTailleProduit;

        if (isset($cookie[$id])) {
            $quantite = $cookie[$id]['quantite'];

            if ($quantite - 1 <= 0) {
                unset($cookie[$id]);
            }else {
                $cookie[$id]['quantite'] = $quantite - 1;
            }

            Cookie::queue('panier', serialize($cookie));
        }
    }

    function deleteProduit(int $idVarianteCouleurProduit, int $idTailleProduit) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idVarianteCouleurProduit. '_' .$idTailleProduit;

        if (isset($cookie[$id])) {
            unset($cookie[$id]);
            Cookie::queue('panier', serialize($cookie));
        }
    }

    function updateQuantity(int $idVarianteCouleurProduit, int $idTailleProduit, int $quantite)
    {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idVarianteCouleurProduit . '_' . $idTailleProduit;

        if (isset($cookie[$id])) {
            $cookie[$id]['quantite'] = $quantite;
        }

        Cookie::queue('panier', serialize($cookie));
    }

    function getProduits() {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $query = VarianteCouleurProduit::select([
            'variantecouleurproduit.idvariantecouleurproduit', 'produit.idproduit', 'tailleproduit.idtailleproduit',
            'titreproduit', 'tailleproduit.nomtailleproduit', 'couleur.nomcouleur',
            'prix'
        ])
        ->join('produit', 'produit.idproduit', '=', 'variantecouleurproduit.idproduit')
        ->join('couleur', 'couleur.idcouleur', '=', 'variantecouleurproduit.idcouleur')
        ->join('produitcontienttaille', 'produitcontienttaille.idproduit', '=', 'produit.idproduit')
        ->join('tailleproduit', 'tailleproduit.idtailleproduit', '=', 'produitcontienttaille.idtailleproduit');

        foreach ($cookie as $value) {
            $query->orWhere(function($query) use($value) {
                $query
                    ->where('variantecouleurproduit.idvariantecouleurproduit', '=', $value['idvariantecouleurproduit'])
                    ->where('produitcontienttaille.idtailleproduit', '=', $value['idtailleproduit']);
            });
        }

        if (empty($cookie))
            return [];

        return $query;
    }

    function getQuantity(int $idVarianteCouleurProduit, int $idTailleProduit) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idVarianteCouleurProduit. '_' .$idTailleProduit;

        if (isset($cookie[$id])) {
            return $cookie[$id]['quantite'];
        }

        return 0;
    }

    function getTotalQuantity() {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $result = 0;

        foreach ($cookie as $value) {
            $result += $value['quantite'];
        }

        return $result;
    }

    function hasProduit(int $idVarianteCouleurProduit, int $idTailleProduit) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idVarianteCouleurProduit. '_' .$idTailleProduit;

        return isset($cookie[$id]);
    }

    function isEmpty() {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        return empty($cookie);
    }

    function clear() {
        Cookie::queue(
            Cookie::forget('panier')
        );
    }
}


