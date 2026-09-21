<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Validation\Rules;
use App\Http\Resources\UserResource;
use Illuminate\Auth\Events\Registered;
use App\Http\Resources\ExercicioResource;
use App\Http\Resources\FichaExercicioResource;
use App\Http\Resources\FichasResource;

class AuthController extends Controller
{
    public function login(Request $request) {
        $dados = $request->validate([
            'email'    => 'required|email',
            'password' => 'required',
        ]);
    
        $user = User::where('email', $dados['email'])->first();
        if (! $user || ! Hash::check($dados['password'], $user->password)) {
            return response()->json(['message' => 'Credenciais inválidas'], 401);
        }
        if(!$user->hasVerifiedEmail()){
            return response()->json(['message' => 'Email não verificado!'], 403);
        }
        if($user->is_admin){
            return response()->json(['message' => 'Acesso negado para Administradores','eAdmin'=>true], 403);
        }
    
        $token = $user->createToken('app-flutter')->plainTextToken;
        return response()->json(['token' => $token, 'user' => new UserResource($user)]);
    }

    public function pegaDados(String $id){
        try {
            $user = User::with('fichas.exercicios')->findOrFail($id);
            $fichas = $user->fichas;

            $exercicios = $fichas->pluck('exercicios')->collapse();

            return response()->json([
                'fichas'          => FichasResource::collection($fichas),
                'fichaExercicio'       => ExercicioResource::collection($exercicios),
            ], 200);

        } catch (\Throwable $th) {
            return response()->json(['message'=>"algo deu errado ( no php authController.pegaDados )"]);
        }
    }

}
