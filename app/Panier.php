<?php

namespace App;

use App\Models\Produit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class Panier {
    function addProduit(int $idproduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idproduit. '_' .$idTailleProduit. '_' .$idCouleur;

        if (isset($cookie[$id])) {
            $quantite = $cookie[$id]['quantite'];
            $cookie[$id]['quantite'] = $quantite + 1;
        }else {
            $cookie[$id] = [
                "idproduit" => $idproduit,
                "idtailleproduit" => $idTailleProduit,
                "idcouleur" => $idCouleur,
                "quantite" => 1
            ];
        }

        Cookie::queue('panier', serialize($cookie));
    }
    
    function add1Produit(int $idproduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];
    
        $id = $idproduit . '_' . $idTailleProduit . '_' . $idCouleur;
    
        if (isset($cookie[$id])) {
            $cookie[$id]['quantite'] += 1;
        } else {
            $cookie[$id] = [
                "idproduit" => $idproduit,
                "idtailleproduit" => $idTailleProduit,
                "idcouleur" => $idCouleur,
                "quantite" => 1
            ];
        }
    
        Cookie::queue('panier', serialize($cookie));
    }

    function removeProduit(int $idproduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idproduit. '_' .$idTailleProduit. '_' .$idCouleur;


        if (isset($cookie[$id])) {
            unset($cookie[$id]);
        }

        Cookie::queue('panier', serialize($cookie));

    }

    function remove1Produit(int $idproduit, int $idTailleProduit, int $idCouleur) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];
    
        $id = $idproduit . '_' . $idTailleProduit . '_' . $idCouleur;
    
        if (isset($cookie[$id])) {
            // S'il y a plus d'un produit, décrémentez simplement la quantité
            if ($cookie[$id]['quantite'] > 1) {
                $cookie[$id]['quantite']--;
            } else {
                // S'il n'y a qu'un seul produit, supprimez complètement l'entrée
                unset($cookie[$id]);
            }
        }
    
        Cookie::queue('panier', serialize($cookie));
    }

    function getProduits() {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        return $cookie;
    }


    function getPrixProduit(int $idproduit, int $idCouleur, $idTailleProduit) {
        $cookie = Cookie::get('panier');
        $cookie = $cookie ? unserialize($cookie) : [];

        $id = $idproduit. '_' .$idTailleProduit. '_' .$idCouleur;

        $quantite = $cookie[$id]['quantite'];

        $produit = Produit::where('produit.idproduit', $idproduit)
                    ->where('idcouleur', $idCouleur)
                    ->join('variantecouleurproduit', 'variantecouleurproduit.idproduit', '=', 'produit.idproduit')

                ->get()->first();
    
        if ($produit) {
            return $quantite * $produit->prix;
        } else {
            return $produit->prix=0; 
        }
    }

    function getPhotoProduit(int $idproduit, int $idCouleur) {
        $produit = Produit::where('produit.idproduit', $idproduit)
                    ->join('produitcontientimage', 'produitcontientimage.idproduit', '=', 'produit.idproduit')
                    ->join('imageproduit', 'imageproduit.idimageproduit', '=', 'produitcontientimage.idimageproduit')
                ->get()->first();

        return $produit->urlimageproduit;

    }

    function getQuantiteTotale() {
        $produits = $this->getProduits();
        $quantiteTotale = 0;

        foreach ($produits as $produit) {
            $quantiteTotale += $produit['quantite'];
        }

        return $quantiteTotale;
    }



    

}


