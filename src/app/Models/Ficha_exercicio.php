<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Ficha_exercicio extends Model
{
    use SoftDeletes, HasFactory;

    protected $table = 'ficha_exercicio';
    public $timestamp = true;
}

