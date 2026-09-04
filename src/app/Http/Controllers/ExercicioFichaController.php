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
        $ficha = Ficha::findOrFail($id);
        if ($ficha->user_id !== Auth::user()->id) {
            abort(403, 'Acesso não autorizado.');
        }
        $exercicios = Exercicio::all();
        return view('fichasExercicioCrud.listafilhaEditar',['ficha'=>$ficha,'naoEdicao'=>false,'exercicios'=>$exercicios]);
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
        try {
            $ficha = Ficha::findOrFail(decrypt($id));
            
            if ($ficha->user_id !== Auth::id()) {
                abort(403, 'Acesso não autorizado.');
            }

            $dadosValidados = $request->validate([
                'dia'                   => ['required', 'integer', 'between:0,6'],
                
                'ordem'                 => ['required', 'array', 'min:1'],
                'exercicio'             => ['required', 'array', 'min:1'],
                'descricao'             => ['nullable', 'array'],
                'numero_de_series'      => ['nullable', 'array'],
                'numero_de_repeticoes'  => ['nullable', 'array'],
                'peso'                  => ['nullable', 'array'],
                'descanso'              => ['nullable', 'array'],

                'ordem.*'               => ['required', 'integer', 'min:0'],
                'exercicio.*'           => ['required', 'integer', 'exists:exercicio,id'],
                'descricao.*'           => ['nullable', 'string'],
                'numero_de_series.*'    => ['nullable', 'integer', 'min:1', 'max:512'],
                'numero_de_repeticoes.*'=> ['nullable', 'integer', 'min:1', 'max:512'],
                'peso.*'                => ['nullable', 'numeric', 'min:0', 'max:999999'],
                'descanso.*'            => ['nullable', 'integer', 'min:0'],
            ]);

            $diasSemana = ['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom'];
            $diasSemanaCompleto = [
                0 => 'Segunda-Feira',
                1 => 'Terça-Feira',
                2 => 'Quarta-Feira',
                3 => 'Quinta-Feira',
                4 => 'Sexta-Feira',
                5 => 'Sábado',
                6 => 'Domingo'
            ];

            foreach ($dadosValidados['exercicio'] as $chave => $exercicioId) {
                
                Ficha_exercicio::create([
                    'ficha_id'     => $ficha->id,
                    'exercicio_id' => $exercicioId,
                    'dias_semana'  => $diasSemana[$dadosValidados['dia']],
                    'ordem'        => $dadosValidados['ordem'][$chave] ?? $chave,
                    'qntdSeries'   => $dadosValidados['numero_de_series'][$chave] ?? null,
                    'qntdRep'      => $dadosValidados['numero_de_repeticoes'][$chave] ?? null,
                    'peso'         => $dadosValidados['peso'][$chave] ?? null,
                    'descricao'    => $dadosValidados['descricao'][$chave] ?? null,
                    'descanso'     => $dadosValidados['descanso'][$chave] ?? null,
                ]);
            }

            $nomeDia = $diasSemanaCompleto[$dadosValidados['dia']];

            return redirect()->back()->with('msg', "Exercícios salvos com sucesso para {$nomeDia}!");

        } catch (\Throwable $th) {
            throw $th;
        }
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
    public function update(Request $request,string $idExercicioFicha)
    {
        //dd($request);
        try {
            $exercicioFicha = Ficha_exercicio::findOrFail($idExercicioFicha);
            $ficha = Ficha::findOrFail($exercicioFicha->ficha_id);
            
            if ($ficha->user_id !== Auth::id()) {
                abort(403, 'Acesso não autorizado.');
            }

            $dadosValidados = $request->validate([
                'exercicio'           => ['required', 'integer', 'exists:exercicio,id'],
                'descricao'           => ['nullable', 'string'],
                'numero_de_series'    => ['nullable', 'integer', 'min:1', 'max:512'],
                'numero_de_repeticoes'=> ['nullable', 'integer', 'min:1', 'max:512'],
                'peso'                => ['nullable', 'numeric', 'min:0', 'max:999999'],
                'descanso'            => ['nullable', 'integer', 'min:0'],
            ]);

            $exercicioFicha->update([
                'exercicio_id' => $dadosValidados['exercicio'],
                'qntdSeries'   => $dadosValidados['numero_de_series'] ?? null,
                'qntdRep'      => $dadosValidados['numero_de_repeticoes'] ?? null,
                'peso'         => $dadosValidados['peso'] ?? null,
                'descricao'    => $dadosValidados['descricao'] ?? null,
                'descanso'     => $dadosValidados['descanso'] ?? null,
            ]);

            $diasSemanaCompleto = [
                'seg' => 'Segunda-Feira',
                'ter' => 'Terça-Feira',
                'qua' => 'Quarta-Feira',
                'qui' => 'Quinta-Feira',
                'sex' => 'Sexta-Feira',
                'sab' => 'Sábado',
                'dom' => 'Domingo'
            ];

            $exercicio = Exercicio::findOrFail($exercicioFicha->exercicio_id);

            $nomeDia = $diasSemanaCompleto[$exercicioFicha->dias_semana];

            return redirect()->back()->with('msg', "Exercício $exercicio->treino do dia $nomeDia atualizado com sucesso!");

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $idExercicioFicha)
    {
        //dd($idExercicioFicha);
        try {
            
            $exercicioFicha = Ficha_exercicio::findOrFail($idExercicioFicha);
            //dd($exercicioFicha);
            $ficha = Ficha::findOrFail($exercicioFicha->ficha_id);
            $exercicio = Exercicio::findOrFail($exercicioFicha->exercicio_id);
            

            if ($ficha->user_id !== Auth::user()->id) {
                abort(403, 'Acesso não autorizado.');
            }

            $chave = $exercicioFicha->dias_semana;

            $exercicioFicha->delete();

            Ficha_exercicio::where('ficha_id',$ficha->id)
            ->where('dias_semana',$chave)
            ->chunk(100, function ($fichaExercicios) {
                $variavel = 1;
                foreach ($fichaExercicios as $fichaExercicio) {
                    $fichaExercicio->update(['ordem' => $variavel]);
                    $variavel++;
                }
            });

            $diasSemanaCompleto = [
                'seg' => 'Segunda-Feira',
                'ter' => 'Terça-Feira',
                'qua' => 'Quarta-Feira',
                'qui' => 'Quinta-Feira',
                'sex' => 'Sexta-Feira',
                'sab' => 'Sábado',
                'dom' => 'Domingo'
            ];

            
            return redirect()->back()->with('msg', "Exercício $exercicio->treino do dia {$diasSemanaCompleto[$chave]} removido com sucesso!");
        } catch (\Throwable $th) {
            throw $th;
        }

    }
}
