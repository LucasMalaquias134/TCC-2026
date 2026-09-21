<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Resources\UserResource;

Route::post('/login', [AuthController::class, 'login']);

Route::middleware(['auth:sanctum', 'verified'])->group(function () {
    
    Route::get('/me', fn(Request $r) => new UserResource($r->user()));   
    Route::post('/logout', function (Request $r) {
        $r->user()->currentAccessToken()->delete();
        return response()->json(null, 204);
    });

    Route::get('/pegaDados/{id}', [AuthController::class, 'pegaDados']);
    
});