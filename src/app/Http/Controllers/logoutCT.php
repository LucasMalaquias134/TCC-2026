<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class logoutCT extends Controller
{
    public function logout(){return view('welcome');}
    public function deleted(){return view('welcome');}
}
