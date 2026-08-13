<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class adminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user = Auth::user();
        if($user->email==='supercanal134@gmail.com'){
            if($request->has('filtro') && $request->filled('filtro')){
                $pesquisa = $request->input('filtro');
                $usuarios = User::select('id', 'name', 'user_name', 'email')
                    ->where('name', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('email', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('user_name', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('id', $pesquisa)
                    ->simplePaginate(30);
            }
            else{
                $usuarios = User::select('id', 'name', 'user_name', 'email')->simplePaginate(30);
            }

            return view('admviews.admview', ['usuarios' => $usuarios]);
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        
        $user = Auth::user();
        if($user->email==='supercanal134@gmail.com'){
            try {
                $usuario = User::findOrFail(decrypt($id));
                if($usuario->email==='supercanal134@gmail.com'){
                    return redirect()->route('admin.dashboard')->with('msg2', "Permisão para apagar Administrador negado");    
                }
                else{
                    $nomeUsuario = $usuario->name;
                    $usuario->delete();
                    return redirect()->route('admin.dashboard')->with('msg', "Usuario $nomeUsuario apagada com Sucesso!");
                }
            } catch (\Throwable $th) {
                throw $th;
            }    
        }
        else{
            abort(403, 'Acesso não autorizado.');
        }
    }
}
