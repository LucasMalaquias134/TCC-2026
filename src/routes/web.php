<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\loginHomeCT; 
use App\Http\Controllers\homeUserprofileCT;
use App\Http\Controllers\listaCT;
use App\Http\Controllers\loginEcadastroCT;
use App\Http\Controllers\logoutCT;

Route::get('/home',[loginHomeCT::class,'index'])->name('home');
Route::post('/login-home',[loginHomeCT::class,'login'])->name('loginhome');
Route::post('/cadastro-home',[loginHomeCT::class,'cadastro'])->name('cadastrohome');

Route::get('/user_profile',[homeUserprofileCT::class,'index'])->name('user_profile');
Route::get('/lista/{numeroFicha}',[listaCT::class,'index'])->name('lista');

Route::get('/',function(){
    return view('welcome');
})->name('welcome');

Route::get('/login',[loginEcadastroCT::class,'login'])->name('login');
Route::get('/cadastro',[loginEcadastroCT::class,'cadastro'])->name('cadastro');

Route::get('/logout',[logoutCT::class,'logout'])->name('logout');
Route::get('/deleted',[logoutCT::class,'deleted'])->name('deleted');