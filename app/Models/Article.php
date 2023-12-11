<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasFactory;

    protected $table = "article";
    protected $primaryKey = "idpublication";
    public $timestamps = false;

    public function photo()
    {
        return $this->hasOne(Photo::class, 'idphoto', 'idphoto');
    }
}
