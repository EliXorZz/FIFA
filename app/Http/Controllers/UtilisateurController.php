<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginUtilisateurRequest;
use App\Models\Utilisateur;
use App\Models\Langue;
use App\Models\Pays;

use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\RegisterUtilisateurRequest;
use App\Http\Requests\UpdateUtilisateurRequest;

use Illuminate\Auth\Events\Registered;
use PhpParser\Node\Expr\FuncCall;
use Symfony\Component\Console\Command\DumpCompletionCommand;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
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
        $user = Utilisateur::create($validated);

        $validated["password"] = $validated["motpasse"];
        unset($validated["motpasse"]);

        event(new Registered($user));

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
        ])->withInput();
    }

    public function update()
    {
        return view('account.update', [
            'langues' => Langue::all(),
            'pays' => Pays::all(),
            'prenomutilisateur' => old('prenomutilisateur', Auth::user()->prenomutilisateur),
            'surnomutilisateur' => old('surnomutilisateur', Auth::user()->surnomutilisateur),
            'mailutilisateur' => old('mailutilisateur', Auth::user()->mailutilisateur),
            'datenaissance' => old('datenaissance', Auth::user()->datenaissance),
            'idlangue' => old('idlangue', Auth::user()->idlangue),
            'idpays' => old('idpays', Auth::user()->idpays),
            'idpaysfavori' => old('idpaysfavori', Auth::user()->idpaysfavori),

        ]);
    }

    public function doUpdate(UpdateUtilisateurRequest $request)
    {
        $validated = $request->validated();

        $user = Auth::user();
        $user->update($validated);

        return redirect()->route('accountUpdate');
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('welcome');
    }

    public function verify() {

        return view('auth.verify-email');

    }

    public function doVerify(EmailVerificationRequest $request)
    {
        $request->fulfill();

        return redirect(RouteServiceProvider::HOME);
    }

    public function resendVerify(Request $request)
    {
            $request->user()->sendEmailVerificationNotification();

            return back()->with('message', 'Email de vérification renvoyer !');
    }
}
