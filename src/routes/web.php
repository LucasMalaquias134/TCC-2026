<?php

use App\Http\Controllers\userProfileController;
use App\Http\Controllers\listaCT;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::middleware(['auth', 'verified'])->group(function () {

    Route::get('/home', function () {
        return view('home');
    })->name('home');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

});

//========Aunteticação===============================

//movimentação; sentido home.blade.php
//Route::get('/home',[AuthController::class,'index'])->name('home');

//Login e Cadrastro
//Route::post('/login-home',[AuthController::class,'login'])->name('loginhome');
//Route::post('/cadastro-home',[AuthController::class,'cadastro'])->name('cadastrohome');

//movimentação; sentido $welcome.login.blade.php$ e $welcome.cadastro.blade.php$ 
//Route::get('/login',[AuthController::class,'loginView'])->name('login');
//Route::get('/cadastro',[AuthController::class,'cadastroView'])->name('cadastro');

//========UserProfile===============================

Route::get('/user_profile{id}',[userProfileController::class,'index'])->name('user_profile');

//Route::post('/user_profile{id}',[userProfileController::class,'update'])->name('updateUser');

//=====================

Route::get('/lista/{numeroFicha}',[listaCT::class,'index'])->name('lista');

require __DIR__.'/auth.php';
