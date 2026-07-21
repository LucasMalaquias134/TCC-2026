<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Attributes\Fillable;

#[Fillable(['user_id', 'name', 'data_inicio', 'data_fim', 'descricao'])]
class Ficha extends Model
{
    use SoftDeletes, HasFactory;

    protected $table = 'ficha';
    public $timestamp = true;

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
    public function exercicios(): BelongsToMany
    {
        return $this->belongsToMany(Exercicio::class, 'ficha_exercicio')
                    ->withPivot('dias_semana') 
                    ->withTimestamps();
    }
    protected function casts(): array
    {
        return [
            'data_inicio' => 'date',
            'data_fim' => 'date',
        ];
    }
    protected static function booted()
    {
        static::deleting(function ($ficha) {
            $exercicios = $ficha->exercicios;
            $ficha->exercicios()->detach();
            foreach ($exercicios as $exercicio) {
                $exercicio->delete();
            }
        });
    }

}
