<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class loginHomeCT extends Controller
{
    public function index(){return view('home');}
    public function login(){return redirect()->route('home');}
    public function cadastro(){return redirect()->route('home');}

}
