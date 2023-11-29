<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VarianteCouleurProduit extends Model
{
    use HasFactory;

     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'variantecouleurproduit';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idvariantecouleurproduit';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    public function produitsSimilaires() {
        return $this->belongsToMany(Produit::class, 'associationproduit', 'idproduit', 'idautreproduit');
    }

    public function produit() {
        return $this->hasOne(Produit::class, 'idproduit');
    }

    public function images() {
        return $this->belongsToMany(ImageProduit::class, 'produitcontientimage', $this->primaryKey, 'idimageproduit');
    }
}
