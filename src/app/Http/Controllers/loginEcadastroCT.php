<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class loginEcadastroCT extends Controller
{
    public function login(){return view('welcome.login');}
    public function cadastro(){return view('welcome.cadastro');}
}
