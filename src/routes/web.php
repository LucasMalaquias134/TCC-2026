<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\homeUserprofileCT;
use App\Http\Controllers\listaCT;
use App\Http\Controllers\AuthController;

//========Aunteticação===============================

//master
Route::get('/',function(){return view('welcome');})->name('welcome');

//movimentação; sentido home.blade.php
Route::get('/home',[AuthController::class,'index'])->name('home');

//Login e Cadrastro
Route::post('/login-home',[AuthController::class,'login'])->name('loginhome');
Route::post('/cadastro-home',[AuthController::class,'cadastro'])->name('cadastrohome');

//movimentação; sentido $welcome.login.blade.php$ e $welcome.cadastro.blade.php$ 
Route::get('/login',[AuthController::class,'loginView'])->name('login');
Route::get('/cadastro',[AuthController::class,'cadastroView'])->name('cadastro');

//Saída
Route::get('/logout',[AuthController::class,'logout'])->name('logout');
Route::get('/deleted',[AuthController::class,'deleted'])->name('deleted');

//===================


Route::get('/user_profile',[homeUserprofileCT::class,'index'])->name('user_profile');
Route::get('/lista/{numeroFicha}',[listaCT::class,'index'])->name('lista');
