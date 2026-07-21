<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ficha;
use App\Models\Exercicio;
use App\Models\Ficha_exercicio;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Arr;

class ExercicioFichaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(string $id)
    {
        $ficha = Ficha::findOrFail(decrypt($id));
        if ($ficha->user_id !== Auth::user()->id) {
            abort(403, 'Acesso não autorizado.');
        }
        return view('listafilhaEditar',['ficha'=>$ficha,'naoEdicao'=>false]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, string $id)
    {
        $ficha = Ficha::findOrFail(decrypt($id));
        
        if ($ficha->user_id !== Auth::id()) {
            abort(403, 'Acesso não autorizado.');
        }

        $dadosValidados = $request->validate([
            'dia'                  => ['required', 'integer', 'between:0,6'],
            'treino'               => ['required', 'string', 'min:3', 'max:255'],
            'ordem'                => ['required', 'integer', 'min:0'],
            'numero_de_series'     => ['required', 'integer', 'min:1', 'max:512'],
            'numero_de_repeticoes' => ['required', 'integer', 'min:1', 'max:512'],
            'peso'                 => ['nullable', 'numeric', 'min:0', 'max:999999'],
            'descricao'            => ['nullable', 'string'],
            'descanso'             => ['nullable', 'integer', 'min:0'],
        ]);

        $diasSemana = ['seg', 'ter', 'qua', 'qui', 'sex', 'sab', 'dom'];
        $diaChave = $diasSemana[$dadosValidados['dia']];

        $exercicio = Exercicio::create([
            'treino'     => $dadosValidados['treino'],
            'ordem'      => $dadosValidados['ordem'],
            'qntdSeries' => $dadosValidados['numero_de_series'],
            'qtndRep'    => $dadosValidados['numero_de_repeticoes'],
            'peso'       => $dadosValidados['peso'],
            'descricao'  => $dadosValidados['descricao'],
            'descanso'   => $dadosValidados['descanso'],
        ]);

        $ficha->exercicios()->attach($exercicio->id, ['dias_semana' => $diaChave]);

        $diasSemanaCompleto = [
            'seg' => 'Segunda-Feira',
            'ter' => 'Terça-Feira',
            'qua' => 'Quarta-Feira',
            'qui' => 'Quinta-Feira',
            'sex' => 'Sexta-Feira',
            'sab' => 'Sábado',
            'dom' => 'Domingo'
        ];

        return redirect()->back()->with('msg', "Exercício $exercicio->treino adicionado com sucesso para {$diasSemanaCompleto[$diaChave]}!");
    }

    /**
     * Display the specified resource. string $id
     */
    public function show()
    {
        return redirect()->route('home')->with('msg', "Ficha de Atualizada Com Sucesso!");
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(string $idFicha, string $idExercicio)
    {
        $ficha = Ficha::findOrFail(decrypt($idFicha));
        $exercicio = Exercicio::findOrFail(decrypt($idExercicio));
        $pivo = $ficha->exercicios->where('id' , $exercicio->id)->first()->pivot;

        dd($ficha);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $idFicha, string $idExercicio)
    {

        $diasSemanaCompleto = [
            'seg' => 'Segunda-Feira',
            'ter' => 'Terça-Feira',
            'qua' => 'Quarta-Feira',
            'qui' => 'Quinta-Feira',
            'sex' => 'Sexta-Feira',
            'sab' => 'Sábado',
            'dom' => 'Domingo'
        ];

        $ficha = Ficha::findOrFail(decrypt($idFicha));
        $exercicio = Exercicio::findOrFail(decrypt($idExercicio));
        $pivo = $ficha->exercicios->where('id' , $exercicio->id)->first()->pivot;

        $chave = $pivo->dias_semana;
        $nome =$exercicio->treino;
        
        if ($ficha->user_id !== Auth::user()->id) {
            abort(403, 'Acesso não autorizado.');
        }

        $ficha->exercicios()->detach(decrypt($idExercicio));

        $exercicio->delete();

        foreach($ficha->exercicios as $exercicioForEach){
            $exercicioForEach->ordem--;
            $exercicioForEach->save();
        }
        
        return redirect()->back()->with('msg', "Exercício $nome do dia {$diasSemanaCompleto[$chave]} removido com sucesso!");
    }
}
