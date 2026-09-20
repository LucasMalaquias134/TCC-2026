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

    public function register(Request $request)
    {
        $request->validate([
            'user_name' => ['required', 'string','max:255','min:3','unique:'.User::class],
            'name' => ['required', 'string', 'max:255', 'min:3'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'idade' => ['nullable','integer','min:10','max:120'],
            'cidadeMora' => ['nullable','string','max:255','min:3'],
            'urlImage' => ['nullable','image','mimes:jpeg,png,jpg','max:2048'],
        ]);

        $caminhoFoto=null;

        if ($request->hasFile('urlImage')) {
            $caminhoFoto = $request->file('urlImage')->store('perfis', 'public');
            $dadosParaSalvar['urlImage'] = $caminhoFoto; 
        }

        $user = User::create([
            'user_name' => $request->user_name,
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'idade' => $request->idade,
            'cidadeMora' => $request->cidadeMora,
            'urlImage' => $caminhoFoto
        ]);

        event(new Registered($user));

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'user' => new UserResource($user),
            'access_token' => $token,
            'token_type' => 'Bearer',
        ], 201);
    }
}
