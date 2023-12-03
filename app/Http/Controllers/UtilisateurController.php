<?php

namespace App\Http\Controllers;

use App\Models\Langue;
use App\Models\Pays;

use Illuminate\Support\Facades\Auth;

use App\Http\Requests\UpdateUtilisateurRequest;
use Stripe\Customer;

class UtilisateurController extends Controller
{
    public function index()
    {
        return view('account', [
            'langues' => Langue::all(),
            'pays' => Pays::all(),
            'prenomutilisateur' => old('prenomutilisateur', Auth::user()->prenomutilisateur),
            'surnomutilisateur' => old('surnomutilisateur', Auth::user()->surnomutilisateur),
            'mailutilisateur' => old('mailutilisateur', Auth::user()->mailutilisateur),
            'datenaissance' => old('datenaissance', Auth::user()->datenaissance),
            'idlangue' => old('idlangue', Auth::user()->idlangue),
            'idpays' => old('idpays', Auth::user()->idpays),
            'idpaysfavori' => old('idpaysfavori', Auth::user()->idpaysfavori),
            'verified' => Auth::user()->hasVerifiedEmail()
        ]);
    }

    public function doUpdate(UpdateUtilisateurRequest $request)
    {
        $validated = $request->validated();

        $user = Auth::user();
        $newMail = $validated['mailutilisateur'];

        $changed = ($user->mailutilisateur != $newMail);

        if ($changed)
        {
            $user->forceFill(['emailverified' => null]);
        }

        $user->update($validated);

        if ($changed) {
            $stripeid = $user->stripeid;

            if ($stripeid != null) {
                Customer::update($stripeid, [
                    'email' => $newMail
                ]);
            }

            $user->sendEmailVerificationNotification();
        }

        return back();
    }
}
