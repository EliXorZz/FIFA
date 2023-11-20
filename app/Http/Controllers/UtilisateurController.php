<?php

namespace App\Http\Controllers;

use App\Models\Utilisateur;
use App\Models\Langue;
use App\Models\Pays;

use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\RegisterUtilisateurRequest;
use Illuminate\Http\Request;

class UtilisateurController extends Controller
{
    public function register()
    {
        return view("auth.register", [ 'langues' => Langue::all() , 'pays' => Pays::all() ]);
    }

    public function doRegister(RegisterUtilisateurRequest $request)
    {
        $validated = $request->validated();
        Utilisateur::create($validated);

        $validated["password"] = $validated["motpasse"];
        unset($validated["motpasse"]);

        if (Auth::attempt($validated)) {
            $request->session()->regenerate();

            return redirect()->intended(RouteServiceProvider::HOME);
        }

        return back();
    }
}


