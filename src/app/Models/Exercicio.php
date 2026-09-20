<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;

#[Fillable(['treino', 'grupo_muscular'])]
class Exercicio extends Model
{
    use SoftDeletes, HasFactory;

    protected $table = 'exercicio';
    public $timestamp = true;

    public function fichas(): BelongsToMany
    {
        return $this->belongsToMany(Ficha::class, 'ficha_exercicio')
                    ->using(Ficha_exercicio::class)
                    ->withPivot('id','dias_semana','ordem','qntdSeries','qntdRep','peso','descricao','descanso')
                    ->wherePivot('deleted_at', null)
                    ->withTimestamps();
    }
    protected static function booted()
    {
        static::deleting(function ($exercicio) {
            Ficha_exercicio::where('exercicio_id', $exercicio->id)->delete();
        });
    }

}
