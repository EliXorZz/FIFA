<?php

namespace App\Http\Controllers;

use App\Http\Requests\VoteRequest;
use App\Models\Joueur;
use App\Models\ThemeVote;
use App\Models\UtilisateurVote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Psy\Output\Theme;

class VoteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function themevote()
    {
        return view('themevote', ['themevotes' => ThemeVote::all()]);
    }

    public function selectedtheme(int $id)
    {
        $joueurs = ThemeVote::select(['joueur.idjoueur', 'nomjoueur', 'prenomjoueur', 'photojoueur'])
            ->join('themevotecontientjoueur','themevotecontientjoueur.idthemevote', '=', 'themevote.idthemevote')
            ->join('joueur', 'themevotecontientjoueur.idjoueur', '=', 'joueur.idjoueur')
            ->where('themevote.idthemevote', '=', $id)
            ->get();

        return view('voter', ['joueurs' => $joueurs, 'titre' => ThemeVote::find($id)]);
    }

    public function doVote(VoteRequest $request)
    {
        $validated = $request->validated();

        $user = $request->user();

        $table = ['check_1', 'check_2', 'check_3'];

        foreach ($table as $key => $value) {
            $vote = new UtilisateurVote();
            $vote->idutilisateur = $user->idutilisateur;
            $vote->idthemevote = $validated['idthemevote'];
            $vote->idjoueur = $validated[$value];
            $vote->rankvote = $key + 1;
            $vote->save();
        }

        return to_route('themevotepage')->with('msg', "Merci d'avoir voter !");
    }
}
