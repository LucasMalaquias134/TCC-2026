<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Ficha_exercicio extends Pivot
{
    use SoftDeletes, HasFactory;

    protected $table = 'ficha_exercicio';
    public $timestamp = true;
}

