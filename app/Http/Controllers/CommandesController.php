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
}

