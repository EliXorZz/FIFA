<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;

    protected $table = "blog";
    protected $primaryKey = "idpublication";
    public $timestamps = false;

    public function photo()
    {
        return $this->hasOne(Photo::class, 'idphoto', 'idphoto');
    }
}
