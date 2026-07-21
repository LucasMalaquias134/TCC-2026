<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ExercicioFichaController;

Route::get('/editarFicha{ficha}', [ExercicioFichaController::class, 'index'])->name('ficha.editar');
Route::post('/editarFicha{ficha}', [ExercicioFichaController::class, 'store'])->name('fichas.storar');
Route::delete('/apagarExercicio/{ficha}/{exercicio}', [ExercicioFichaController::class, 'destroy'])->name('fichas.deletar');