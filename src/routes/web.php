<?php

use App\Http\Controllers\FichaController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::middleware(['auth', 'verified'])->group(function () {

    //bleeze---------------------------------------------------------------------------------------------------------------------------------------
    
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    //lucas---------------------------------------------------------------------------------------------------------------------------------------
    
    Route::get('/home', [FichaController::class, 'index'])->name('home');
    Route::resource('fichas', FichaController::class);
    
    require __DIR__.'/fichaexercicioRoutes.php';

});


require __DIR__.'/auth.php';
