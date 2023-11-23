<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginUtilisateurRequest;
use App\Models\Utilisateur;
use App\Models\Langue;
use App\Models\Pays;

use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\RegisterUtilisateurRequest;
use Illuminate\Http\Request;
use Spatie\LaravelIgnition\Solutions\SolutionProviders\RunningLaravelDuskInProductionProvider;
use Symfony\Component\Mailer\Transport\Smtp\Auth\LoginAuthenticator;
use Symfony\Component\Process\Pipes\WindowsPipes;

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

    public function login()
    {
        return view("auth.login");
    }

    public function doLogin(LoginUtilisateurRequest $request)
    {
        $validated = $request->validated();

        $validated["password"] = $validated["motpasse"];
        unset($validated["motpasse"]);

        if (Auth::attempt($validated)) {
            $request->session()->regenerate();

            return redirect()->intended(RouteServiceProvider::HOME);
        }

        return back()->withErrors([
            'identifiant' => 'Mauvais identifiant ou mot de passe.',
        ]);
    }
}


