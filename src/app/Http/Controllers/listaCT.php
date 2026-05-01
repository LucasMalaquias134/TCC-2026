<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class listaCT extends Controller
{
    public function index($numeroficha){

        $fichas = [
            (object) [
                'ordem' => 1,
                'nomeTreino' => 'Supino Reto',
                'desc' => 'Mantenha as escápulas retraídas e a barra descendo até o peito.',
                'series' => 4,
                'reps' => 12
            ],
            (object) [
                'ordem' => 2,
                'nomeTreino' => 'Crucifixo Inclinado',
                'desc' => 'Foco no alongamento das fibras superiores do peitoral.',
                'series' => 3,
                'reps' => 15
            ],
            (object) [
                'ordem' => 3,
                'nomeTreino' => 'Tríceps Corda',
                'desc' => 'Extensão total do cotovelo com pico de contração no final.',
                'series' => 4,
                'reps' => 10
            ],
        ];

        $lista = 'lista' . $numeroficha;
        return view($lista,compact('fichas' , 'numeroficha'));
    }
}
