<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Commande;
use Illuminate\Support\Facades\Auth;

class CommandesController extends Controller
{

    public function index()
    {
        $utilisateur = Auth::user();
        
        if ($utilisateur) {
            $commandes = $utilisateur->commandes;
        } else {
            return redirect()->route('login');
        }
        
        return view('commandes', [
            'commandes' => $commandes
        ]);

    }

    function commande(Commande $commande) {
        $produits = $commande
            ->select('produit.idproduit', 'variantecouleurproduit.idcouleur', 'lignecommande.idtailleproduit', 'titreproduit', 'nomcouleur', 'nomtailleproduit', 'quantitecommande', 'prixunitaire')
            ->join('lignecommande', 'lignecommande.idcommande', 'commande.idcommande')
            ->join('tailleproduit', 'tailleproduit.idtailleproduit', '=', 'lignecommande.idtailleproduit')
            ->join('variantecouleurproduit', 'variantecouleurproduit.idvariantecouleurproduit', 'lignecommande.idvariantecouleurproduit')
            ->join('couleur', 'variantecouleurproduit.idcouleur', '=', 'couleur.idcouleur')
            ->join('produit', 'produit.idproduit', 'variantecouleurproduit.idproduit')
            ->where('commande.idcommande', '=', $commande->idcommande)
            ->get();

        $quantite = 0;
        foreach ($produits as $produit) {
            $quantite += $produit->quantitecommande;
        }

        return view('detailscommande', [
            'commande' => $commande,
            'produits' => $produits,

            'quantite' => $quantite
        ]);
    }
}

