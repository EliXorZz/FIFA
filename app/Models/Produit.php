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

    public function variantes() {
        return $this->hasMany(VarianteCouleurProduit::class, $this->primaryKey, $this->primaryKey);
    }

    public function produitsSimilaires() {
        return $this->belongsToMany(Produit::class, 'associationproduit', $this->primaryKey, 'idautreproduit');
    }

    public function categories() {
        return $this->belongsToMany(Produit::class, 'categoriecontientproduit', $this->primaryKey, 'idcategorieproduit');
    }

    public function tailles() {
        return $this->belongsToMany(TailleProduit::class, 'produitcontienttaille', $this->primaryKey, 'idtailleproduit');
    }

    public function couleurs() {
        return $this->belongsToMany(Couleur::class, 'produitcontientcouleur', $this->primaryKey, 'idcouleur');
    }
}
