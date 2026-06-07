<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function index(){
        return view('home');
    }

    public function loginView(){
        return view('welcome.login');
    }

    public function cadastroView(){
        return view('welcome.cadastro');
    }

    public function login(){
        return redirect()->route('home');
    }

    public function cadastro(){
        return redirect()->route('home');
    }

    public function logout(){
        return view('welcome');
    }

    public function deleted(){
        return view('welcome');
    }
}
