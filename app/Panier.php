<?php

namespace App;

use App\Models\Produit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class Panier {
    function addProduit(int $idProduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idProduit. '_' .$idTailleProduit. '_' .$idCouleur;

        if (isset($cookie[$id])) {
            $quantite = $cookie[$id]['quantite'];
            $cookie[$id]['quantite'] = $quantite + 1;
        }else {
            $cookie[$id] = [
                "idproduit" => $idProduit,
                "idtailleproduit" => $idTailleProduit,
                "idcouleur" => $idCouleur,
                "quantite" => 1
            ];
        }

        Cookie::queue('panier', serialize($cookie));
    }

    function removeProduit(int $idProduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idProduit. '_' .$idTailleProduit. '_' .$idCouleur;

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

    function deleteProduit(int $idProduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idProduit. '_' .$idTailleProduit. '_' .$idCouleur;

        if (isset($cookie[$id])) {
            unset($cookie[$id]);
            Cookie::queue('panier', serialize($cookie));
        }
    }

    public function updateQuantity(int $idProduit, int $idTailleProduit, int $idCouleur, int $quantite)
    {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idProduit . '_' . $idTailleProduit . '_' . $idCouleur;

        if (isset($cookie[$id])) {
            $cookie[$id]['quantite'] = $quantite;
        }

        Cookie::queue('panier', serialize($cookie));
    }

    function getProduits() {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $query = Produit::select([
            'produit.idproduit', 'tailleproduit.idtailleproduit', 'couleur.idcouleur',
            'titreproduit', 'tailleproduit.nomtailleproduit', 'couleur.nomcouleur',
            'prix'
        ])
        ->join('variantecouleurproduit', 'variantecouleurproduit.idproduit', '=', 'produit.idproduit')
        ->join('couleur', 'couleur.idcouleur', '=', 'variantecouleurproduit.idcouleur')
        ->join('produitcontienttaille', 'produitcontienttaille.idproduit', '=', 'produit.idproduit')
        ->join('tailleproduit', 'tailleproduit.idtailleproduit', '=', 'produitcontienttaille.idtailleproduit');

        foreach ($cookie as $value) {
            $query = $query->orWhere(function($query) use($value) {
                $query
                    ->where('produit.idproduit', '=', $value['idproduit'])
                    ->where('variantecouleurproduit.idcouleur', '=', $value['idcouleur'])
                    ->where('produitcontienttaille.idtailleproduit', '=', $value['idtailleproduit']);
            });
        }

        if (empty($cookie))
            return [];

        return $query;
    }

    function getQuantity(int $idProduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idProduit. '_' .$idTailleProduit. '_' .$idCouleur;

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

    function hasProduit(int $idProduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idProduit. '_' .$idTailleProduit. '_' .$idCouleur;

        return isset($cookie[$id]);
    }
}


