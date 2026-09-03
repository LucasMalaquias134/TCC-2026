<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exercicio;
use Illuminate\Support\Facades\Auth;

class ExercicioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user = Auth::user();
        if($user->is_admin===true){
            if($request->has('filtro') && $request->filled('filtro')){
                $pesquisa = $request->input('filtro');
                $exercicios = Exercicio::select('id','treino', 'grupo_muscular')
                    ->where('treino', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('grupo_muscular', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('id', 'LIKE', "%{$pesquisa}%")
                    ->simplePaginate(30);
            }
            else{
                $exercicios = Exercicio::select('id','treino', 'grupo_muscular')->simplePaginate(30);
            }

            return view('exerciciosviews.exercicioindex', ['exercicios' => $exercicios]);
        }
        else{
            abort(403, 'Acesso não autorizado.');
        }
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
    public function store(Request $request)
    {
        $user = Auth::user();
        if($user->is_admin===true){
            try {
                $dadosValidados = $request->validate([
                    'treino' => ['required', 'string', 'min:3', 'max:255'],
                    'grupo_muscular' => ['required', 'string', 'min:3', 'max:255'],
                    ]);

                $exercicio = Exercicio::create($dadosValidados);
                
                return redirect()->route('exercicio.index')->with('msg', "Exercicio $request->treino ( id = $exercicio->id ) criado com Sucesso!");
            } catch (\Throwable $th) {
                throw $th;
            }
        }
        else{
            abort(403, 'Acesso não autorizado.');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
    public function update(Request $request, string $id)
    {
        $user = Auth::user();
        if($user->is_admin===true){
            try {
                $exercicio = Exercicio::findOrFail($id);

                $dadosValidados = $request->validate([
                    'treino' => ['required', 'string', 'min:3', 'max:255'],
                    'grupo_muscular' => ['required', 'string', 'min:3', 'max:255'],
                    ]);

                $exercicio->update($dadosValidados);
                
                return redirect()->route('exercicio.index')->with('msg', "Exercicio $request->treino ( id = $exercicio->id ) atualizado com Sucesso!");
            } catch (\Throwable $th) {
                throw $th;
            }
        }
        else{
            abort(403, 'Acesso não autorizado.');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = Auth::user();
        if($user->is_admin===true){
            try {

                $exercicio = Exercicio::findOrFail(decrypt($id));
                $nomeexercicio = $exercicio->treino;
                $exercicio->delete();
                return redirect()->route('exercicio.index')->with('msg', "Exercicio $nomeexercicio apagado com Sucesso!");

            } catch (\Throwable $th) {
                throw $th;
            }    
        }
        else{
            abort(403, 'Acesso não autorizado.');
        }
    }
}
