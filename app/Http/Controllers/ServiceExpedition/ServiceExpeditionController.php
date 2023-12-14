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

    function index(ServiceExpeditionRequest $request, TypeLivraison $typelivraison = null) {
        $validated = $request->validated();

        $hasTypeLivraison = $typelivraison != null;

        $commandes = $hasTypeLivraison ? $typelivraison->commandes() : Commande::query();

        if (isset($validated['search'])) {
            $keywords = explode(',', $validated['search']);

            $commandes->where(function($query) use($keywords) {
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
            'title' => $hasTypeLivraison ? "($typelivraison->nomlivraison)" : "",

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

        return back()
            ->with('notification', "La commande n°$commande->idcommande vient d'être expédiée !");
    }

    function commande(Commande $commande) {
        $commande
            ->load(['lignes.variante.produit', 'lignes.variante.couleur', 'lignes.taille']);

        $lignes = $commande->lignes;

        $quantite = 0;
        foreach ($lignes as $ligne) {
            $quantite += $ligne->quantitecommande;
        }

        return view('service-expedition.commande', [
            'commande' => $commande,
            'lignes' => $lignes,

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
        $account_sid = config("twilio.account");
        $auth_token = config("twilio.token");
        $twilio_from = config("twilio.number");

        $client = new Client($account_sid, $auth_token);

        $client->messages->create($phone, [
            'from' => $twilio_from,
            'body' => $message
        ]);
    }
}
