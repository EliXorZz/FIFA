<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commande extends Model
{
    protected $table = 'commande';

    protected $primaryKey = 'idcommande';

    protected $fillable = [
        'idtypelivraison',
        'idutilisateur',
        'villelivraisoncmd',
        'ruelivraisoncmd',
        'postallivraisoncmd',
        'villefacturationcmd',
        'ruefacturationcmd',
        'postalfacturationcmd',
        'prixlivraisoncmd',
        'tvacmd',
        'expeditioncmd'
    ];

    public function typeLivraison() {
        return $this->hasOne(TypeLivraison::class, 'idtypelivraison', 'idtypelivraison');
    }
}
