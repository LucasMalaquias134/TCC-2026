<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ficha;
use Illuminate\Support\Facades\Auth;

use function PHPUnit\Framework\isNull;

class FichaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $usuario = $request->user();
        $query = $usuario->fichas();

        if ($request->has('filtro') && $request->filled('filtro')) {
            $pesquisa = $request->input('filtro');
            $query->where('name', 'LIKE', "%{$pesquisa}%");
        }

        $ordenacao = $request->input('ordernar')??0; 

        switch ($ordenacao) {
            case '1': 
                $query->orderBy('data_inicio', 'asc');
                break;
            case '2': 
                $query->orderBy('name', 'asc');
                break;
            case '3': 
                $query->orderBy('name', 'desc');
                break;
            case '0':
            default:
                $query->orderBy('data_inicio', 'desc');
                break;
        }

        $fichas = $query->get();

        return view('home', ['fichas' => $fichas]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('fichasCRUD.fichasCreate');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $dadosValidados = $request->validate([
            'name' => ['required', 'string', 'min:3', 'max:255'],
            'data_inicio' => ['required', 'date'],
            'data_fim' => ['required', 'date', 'after_or_equal:data_inicio'],
            'descricao' => ['nullable', 'string'],
            ]);

        $request->user()->fichas()->create($dadosValidados);

        $nomeFicha = $request->name;

        return redirect()->route('home')->with('msg', "Ficha $nomeFicha criada com Sucesso!");
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $ficha = Ficha::findOrFail(decrypt($id));
        if ($ficha->user_id !== Auth::user()->id) {
            abort(403, 'Acesso não autorizado.');
        }
        return view('listafilhaVer',['ficha'=>$ficha,'naoEdicao'=>true]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $ficha = Ficha::findOrFail(decrypt($id));

        if ($ficha->user_id !== Auth::user()->id) {
            abort(403, 'Acesso não autorizado.');
        }

        return view('fichasCRUD.fichasEdit',['ficha'=>$ficha]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $ficha = Ficha::findOrFail(decrypt($id));

        if ($ficha->user_id !== Auth::id()) {
            abort(403);
        }

        $dadosValidados = $request->validate([
            'name' => ['required', 'string', 'min:3', 'max:255'],
            'data_inicio' => ['required', 'date'],
            'data_fim' => ['required', 'date', 'after_or_equal:data_inicio'],
            'descricao' => ['nullable', 'string'],
            ]);

        $ficha->update($dadosValidados);
        
        return redirect()->route('home')->with('msg', "Ficha $request->name atualizada com Sucesso!");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Ficha $ficha)
    {
        if ($ficha->user_id !== Auth::user()->id) {
            abort(403, 'Acesso não autorizado.');
        }
        $nomeFicha = $ficha->name;
        $ficha->delete();
        return redirect()->route('home')->with('msg', "Ficha $nomeFicha apagada com Sucesso!");
    }
}
