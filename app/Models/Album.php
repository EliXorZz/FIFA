<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Album extends Model
{
    use HasFactory;

    protected $table = "album";
    protected $primaryKey = "idpublication";
    public $timestamps = false;

    public function photo()
    {
        return $this->hasOne(Photo::class, 'idphoto', 'idphoto');
    }

    public function allphoto()
    {
        return $this->belongsToMany(Photo::class, 'albumcontientphoto', $this->primaryKey, 'idphoto');
    }
}
