<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Validation\Rules;
use App\Http\Resources\UserResource;

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
    
        $token = $user->createToken('app-flutter')->plainTextToken;
        return response()->json(['token' => $token, 'user' => new UserResource($user)]);
    }

    public function register(Request $request)
    {
        $dadosValidados = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        $user = User::create([
            'name' => $dadosValidados['name'],
            'email' => $dadosValidados['email'],
            'password' => Hash::make($dadosValidados['password']),
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'user' => $user,
            'access_token' => $token,
            'token_type' => 'Bearer',
        ], 201);
    }
}
