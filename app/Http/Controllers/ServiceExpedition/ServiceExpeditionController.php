<?php

namespace App\Http\Controllers\ServiceExpedition;

use App\Http\Controllers\Controller;
use App\Http\Requests\ServiceExpeditionRequest;
use App\Http\Requests\ServiceExpeditionSMSRequest;
use App\Models\Commande;
use App\Models\TypeLivraison;
use Illuminate\Http\Request;

use Twilio\Rest\Client;

class ServiceExpeditionController extends Controller
{
    function default() {
        return redirect()->route('service-expedition', [
            'typelivraison' => TypeLivraison::first()
        ]);
    }

    function index(ServiceExpeditionRequest $request, TypeLivraison $typelivraison) {
        $validated = $request->validated();

        $commandes = $typelivraison->commandes();

        if (isset($validated['search'])) {
            $keywords = explode(',', $validated['search']);

            $commandes = $commandes->where(function($query) use($keywords) {
                foreach ($keywords as $keyword) {
                    $query->where('commande.idcommande', '=', $keyword);
                }
            });
        }

        $commandes = $commandes
            ->orderBy('expeditioncmd')
            ->orderBy('idcommande')
            ->simplePaginate(10);

        return view('service-expedition.index', [
            'typelivraison' => $typelivraison,
            'commandes' => $commandes
        ]);
    }

    function doCommande(Commande $commande) {
        $acheteur = $commande->acheteur()
            ->first();

        $commande->expeditioncmd = true;
        $commande->save();

        $this->sendSMS($acheteur->getSMSPhoneNumber(), "Votre commande n°$commande->idcommande a été expédié");

        return back()->with('notification', "La commande n°$commande->idcommande vient d'être expédiée !");
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

        return view('service-expedition.commande', [
            'commande' => $commande,
            'produits' => $produits,

            'quantite' => $quantite
        ]);
    }

    function doCommandeSMS(ServiceExpeditionSMSRequest $request, Commande $commande) {
        $validated = $request->validated();

        $acheteur = $commande->acheteur()
            ->first();

        $this->sendSMS($acheteur->getSMSPhoneNumber(), $validated['message']);

        return back();
    }

    function sendSMS($phone, $message) {
        $account_sid = getenv("TWILIO_SID");
        $auth_token = getenv("TWILIO_TOKEN");
        $twilio_from = getenv("TWILIO_NUMBER");

        $client = new Client($account_sid, $auth_token);

        $client->messages->create($phone, [
            'from' => $twilio_from,
            'body' => $message
        ]);
    }
}
