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

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'idproduit',
        'idcouleur',
        'prix'
    ];

    public function produit() {
        return $this->hasOne(Produit::class, 'idproduit', 'idproduit');
    }

    public function couleur() {
        return $this->hasOne(Couleur::class, 'idcouleur', 'idcouleur');
    }

    public function images() {
        return $this->belongsToMany(ImageProduit::class, 'produitcontientimage', $this->primaryKey, 'idimageproduit');
    }
}
