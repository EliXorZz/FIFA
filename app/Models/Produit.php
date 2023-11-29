<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produit extends Model
{
    use HasFactory;

     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'produit';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idproduit';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    public function tailles() {
        return $this->belongsToMany(TailleProduit::class, 'produitcontienttaille', $this->primaryKey, 'idtailleproduit');
    }

    public function variantes() {
        return $this->belongsToMany(Couleur::class, 'variantecouleurproduit', $this->primaryKey, 'idcouleur')
            ->withPivot('prix');
    }

    public function images() {
        return $this->belongsToMany(ImageProduit::class, 'produitcontientimage', 'idvariantecouleurproduit', 'idimageproduit');
    }
}
