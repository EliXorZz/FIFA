<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    use HasFactory;

    protected $table = "document";
    protected $primaryKey = "idpublication";
    public $timestamps = false;

    public function photo()
    {
        return $this->hasOne(Photo::class, 'idphoto', 'idphoto');
    }
}
