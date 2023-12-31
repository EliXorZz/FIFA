<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commande extends Model
{
    use HasFactory;

     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'commande';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idcommande';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    public function acheteur() {
        return $this->hasOne(Utilisateur::class, 'idutilisateur', 'idutilisateur');
    }

    public function typeLivraison() {
        return $this->hasOne(TypeLivraison::class, 'idtypelivraison', 'idtypelivraison');
    }

    public function lignes() {
        return $this->hasMany(LigneCommande::class, $this->primaryKey, $this->primaryKey);
    }
}
