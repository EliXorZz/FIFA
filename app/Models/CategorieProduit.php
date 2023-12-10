<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategorieProduit extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'categorieproduit';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idcategorieproduit';

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
        'nomcategorieproduit',
        'parentcategorieproduit'
    ];

    function parents() {
        return $this->belongsToMany(CategorieProduit::class, 'souscategorieproduit', 'idautrecategorieproduit', $this->primaryKey);
    }

    function sousCategories() {
        return $this->belongsToMany(CategorieProduit::class, 'souscategorieproduit', $this->primaryKey, 'idautrecategorieproduit');
    }

    function produits() {
        return $this->belongsToMany(Produit::class, 'categoriecontientproduit', $this->primaryKey, 'idproduit');
    }
}
