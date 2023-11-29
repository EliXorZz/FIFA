<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginUtilisateurRequest;
use App\Http\Requests\RegisterUtilisateurRequest;
use App\Models\Langue;
use App\Models\Pays;
use App\Models\Utilisateur;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register()
    {
        return view("auth.register", [
            'langues' => Langue::all(),
            'pays' => Pays::all()
        ]);
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

            return redirect()->route('verification.notice');
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

    public function logout()
    {
        Auth::logout();

        return redirect(RouteServiceProvider::HOME);
    }

    public function verify(Request $request) {
        return view('auth.verify', [
            'mail' => $request->user()->getEmailForVerification()
        ]);
    }

    public function doVerify(EmailVerificationRequest $request)
    {
        $request->fulfill();

        return redirect(RouteServiceProvider::HOME);
    }

    public function resendVerify(Request $request)
    {
        $request->user()->sendEmailVerificationNotification();

        return back()
            ->with('send', 'Un mail de confirmation à été envoyer à l\'adresse ci-dessous, verifiez vos SPAMS');
    }
}
