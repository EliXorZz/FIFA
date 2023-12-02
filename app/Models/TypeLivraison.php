<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeLivraison extends Model
{
    use HasFactory;

     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'typelivraison';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idtypelivraison';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    public function commandes() {
        return $this->hasMany(Commande::class, $this->primaryKey, $this->primaryKey);
    }
}
