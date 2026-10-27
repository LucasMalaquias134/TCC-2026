<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
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
                $usuarios = User::select('id', 'name', 'user_name', 'email' , 'idade', 'cidadeMora' , 'urlImage')
                    ->where('name', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('email', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('user_name', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('id', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('idade', 'LIKE', "%{$pesquisa}%")
                    ->orWhere('cidadeMora', 'LIKE', "%{$pesquisa}%")
                    ->simplePaginate(30);
            }
            else{
                $usuarios = User::select('id', 'name', 'user_name', 'email' , 'idade', 'cidadeMora' , 'urlImage')->simplePaginate(30);
            }

            return view('admviews.admview', ['usuarios' => $usuarios]);
        }
        else{
            abort(403, 'Acesso não autorizado.');
        }
    }
    public function destroy(string $id)
    {
        
        $user = Auth::user();
        if($user->is_admin===true){
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
