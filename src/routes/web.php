<?php

use App\Http\Controllers\FichaController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AdminController;
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

    Route::get('/adminPage', [AdminController::class, 'index'])->name('admin.dashboard');
    Route::get('/adminSearch', [AdminController::class, 'index'])->name('admin.search');
    Route::delete('/adminDestroy{id}', [AdminController::class, 'destroy'])->name('admin.destroy');

});


require __DIR__.'/auth.php';
