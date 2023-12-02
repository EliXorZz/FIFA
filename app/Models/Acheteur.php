<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Acheteur extends Model
{
    use HasFactory;

     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'acheteur';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'idutilisateur';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    public function getSMSPhoneNumber() {
        return $this->telephone;
    }
}
