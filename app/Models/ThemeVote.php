<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThemeVote extends Model
{
    use HasFactory;

    protected $table = "themevote";
    protected $primaryKey = "idthemevote";
    public $timestamps = false;
}
