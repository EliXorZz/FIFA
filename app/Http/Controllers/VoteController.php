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
        $mesThemes = ThemeVote::all();
        $mesVoteDejaVoter = [];
        foreach ($mesThemes as $value) {
            if(count($this->checkifalreadyvote($value->idthemevote)))
            {
                array_push($mesVoteDejaVoter,[$value->idthemevote,true]);
            }
            else
            {
                array_push($mesVoteDejaVoter,[$value->idthemevote,false]);
            }
        }
        return view('themevote', ['themevotes' => $mesThemes, 'alreayvote' => $mesVoteDejaVoter]);
    }

    public function selectedtheme(int $id)
    {
        $joueurs = ThemeVote::select(['joueur.idjoueur', 'nomjoueur', 'prenomjoueur', 'photojoueur'])
            ->join('themevotecontientjoueur','themevotecontientjoueur.idthemevote', '=', 'themevote.idthemevote')
            ->join('joueur', 'themevotecontientjoueur.idjoueur', '=', 'joueur.idjoueur')
            ->where('themevote.idthemevote', '=', $id)
            ->get();

        $mesVotes = $this->checkifalreadyvote($id);


        $selected = [];
        if(count($mesVotes))
        {
            foreach ($mesVotes as $value) {
                array_push($selected,[$value->idjoueur, $value->rankvote]);
            }
        }
        return view('voter', ['joueurs' => $joueurs, 'titre' => ThemeVote::find($id), 'voter' => $selected]);
    }

    public function checkifalreadyvote(int $idvote)
    {
        $mesVotes = collect();

        if (Auth::check()) {
            $user = Auth::user();
            $mesVotes = UtilisateurVote::select(['utilisateurvote.idutilisateur','utilisateurvote.idthemevote','utilisateurvote.idjoueur','rankvote'])
                ->where('utilisateurvote.idutilisateur','=', $user->idutilisateur)
                ->where('utilisateurvote.idthemevote','=', $idvote)
                ->get();
        }

        return $mesVotes;
    }

    public function doVote(VoteRequest $request)
    {
        $mesVotes = $this->checkifalreadyvote($request->input('idthemevote'));

        if(count($mesVotes))
        {
            return to_route('themevotepage')->with('msg', "Vous avez déjà voter sur ce theme");
        }

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
