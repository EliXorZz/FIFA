<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Acheteur; 
use App\Http\Requests\CommandeAcheteurRequest;

class CommandeController extends Controller
{
    public function index()
    {
        return view('commande');
    }




}
