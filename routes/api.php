<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProjectController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::resource('/project', \App\Http\Controllers\ProjectController::class);
    Route::resource('/blog', \App\Http\Controllers\BlogController::class);
    Route::get('/dashboard', [\App\Http\Controllers\DashboardController::class, 'index']);
    
});

Route::get('/view/projects',  [ProjectController::class, 'FrontShowProject']);

Route::post('/login', [AuthController::class, 'login']);