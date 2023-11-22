<?php

namespace App;

use App\Models\Produit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class Panier {
    function addProduit(Produit $produit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $produit->idproduit. '_' .$idTailleProduit. '_' .$idCouleur;

        if (isset($cookie[$id])) {
            $quantite = $cookie[$id]['quantite'];
            $cookie[$id]['quantite'] = $quantite + 1;
        }else {
            $cookie[$id] = [
                "idproduit" => $produit->idproduit,
                "idtailleproduit" => $idTailleProduit,
                "idcouleur" => $idCouleur,
                "quantite" => 1
            ];
        }

        Cookie::queue('panier', serialize($cookie));
    }

    function removeProduit(Produit $produit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('shopping-cart', []);
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $produit->idproduit. '_' .$idTailleProduit. '_' .$idCouleur;

        if (isset($cookie[$id])) {
            $quantite = $cookie[$id]['quantite'];

            if ($quantite - 1 <= 0) {
                unset($cookie[$id]);
            }else {
                $cookie[$id]['quantite'] = $quantite - 1;
            }
        }else {
            $cookie[$id] = [
                "idproduit" => $produit->idproduit,
                "idtailleproduit" => $idTailleProduit,
                "idcouleur" => $idCouleur,
                "quantite" => 1
            ];
        }

        Cookie::queue('panier', serialize($cookie));
    }

    function getProduits() {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        return $cookie;
    }
}
