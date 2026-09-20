<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExercicioResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->pivot->id,
            'treino' => $this->treino,
            'ficha_id'=>$this->pivot->ficha_id,
            'dias_semana' => $this->pivot->dias_semana,
            'ordem' => $this->pivot->ordem,
            'qntdSeries' => $this->pivot->qntdSeries,
            'qntdRep' => $this->pivot->qntdRep,
            'peso' => $this->pivot->peso,
            'descricao' => $this->pivot->descricao,
            'descanso' => $this->pivot->descanso,
        ];
    }
}
//não ta utilizando fichaexercicioResource, fichaApiController, ExercicioApiController