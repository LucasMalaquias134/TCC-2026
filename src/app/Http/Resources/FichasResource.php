<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;

class FichasResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'=>$this->id,
            'name'=>$this->name,
            'data_inicio'=>Carbon::parse($this->data_inicio)->format('d/m/Y'),
            'data_fim'=>Carbon::parse($this->data_fim)->format('d/m/Y'),
            'descricao'=>$this->descricao
        ];
    }
}
