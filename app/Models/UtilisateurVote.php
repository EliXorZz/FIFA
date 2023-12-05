<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UtilisateurVote extends Model
{
    use HasFactory;

    protected $primaryKey = "idutilisateur";
    protected $table = "utilisateurvote";
    public $timestamps = false;

}
