<?php

use App\Http\Controllers\FichaController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ExercicioFichaController;
use App\Http\Controllers\ExercicioController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::middleware(['auth', 'verified','user'])->group(function () {

    //bleeze---------------------------------------------------------------------------------------------------------------------------------------
    
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    //lucas---------------------------------------------------------------------------------------------------------------------------------------
    
    //---------------------fichas-----------------------------
    Route::get('/home', [FichaController::class, 'index'])->name('home');
    Route::resource('fichas', FichaController::class);
    
    //---------------------Exercicios e Ficha-----------------------------
    Route::get('/editarFicha{ficha}', [ExercicioFichaController::class, 'index'])->name('ficha.editar');
    Route::post('/editarFicha{ficha}', [ExercicioFichaController::class, 'store'])->name('fichas.storar');
    Route::delete('/apagarExercicio/{ficha}/{exercicio}', [ExercicioFichaController::class, 'destroy'])->name('fichas.deletar');

    
    });
Route::middleware(['auth', 'verified' ,'admin'])->group(function () {

    //---------------------Usuarios-----------------------------
    Route::get('/adminPage', [AdminController::class, 'index'])->name('admin.dashboard');
    Route::get('/adminSearch', [AdminController::class, 'index'])->name('admin.search');
    Route::delete('/adminDestroy{id}', [AdminController::class, 'destroy'])->name('admin.destroy');
    
    //---------------------Exercicios-----------------------------
    Route::resource('exercicio', ExercicioController::class);

});



require __DIR__.'/auth.php';
