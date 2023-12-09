<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LigneCommande extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'lignecommande';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idlignecmd';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    public function variante() {
        return $this->hasOne(VarianteCouleurProduit::class, 'idvariantecouleurproduit', 'idvariantecouleurproduit');
    }

    public function taille() {
        return $this->hasOne(TailleProduit::class, 'idtailleproduit', 'idtailleproduit');
    }
}
