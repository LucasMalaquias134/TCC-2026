<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('welcome.cadastro');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'user_name' => ['required', 'string','max:255','min:3','unique:'.User::class],
            'name' => ['required', 'string', 'max:255', 'min:3'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'idade' => ['nullable','integer','min:18','max:120'],
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

        Auth::login($user);

        return redirect(route('home', absolute: false));
    }
}
