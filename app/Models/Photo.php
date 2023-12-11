<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Photo extends Model
{
    use HasFactory;

    protected $table = "photo";
    protected $primaryKey = "idphoto";
    public $timestamps = false;

    public function photo()
    {
        return $this->hasOne(Photo::class, 'idphoto', 'idphoto');
    }
}
