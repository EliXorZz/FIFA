<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImageProduit extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'imageproduit';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idimageproduit';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    function variantes() {
        return $this->belongsToMany(VarianteCouleurProduit::class, 'produitcontientimage', $this->primaryKey, 'idvariantecouleurproduit');
    }
}
