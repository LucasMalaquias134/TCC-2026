<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Exercicio extends Model
{
    use SoftDeletes, HasFactory;

    protected $table = 'exercicio';
    public $timestamp = true;

    public function fichas(): BelongsToMany
    {
        return $this->belongsToMany(Ficha::class, 'ficha_exercicio')
                    ->withPivot('dias_semana')
                    ->withTimestamps();
    }

}
