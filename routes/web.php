<?php

use App\Http\Controllers\ProduitController;
use App\Http\Controllers\UtilisateurController;

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::get('/produits', [ ProduitController::class, 'index' ])
    ->name('produits');

Route::get('/produits/{produit}', [ ProduitController::class, 'show' ])
    ->name('produit');

Route::get("/register", [ UtilisateurController::class, 'register' ])
    ->middleware('guest')
    ->name("register");

Route::post("/register", [ UtilisateurController::class, 'doRegister' ])
    ->middleware('guest')
    ->name("doRegister");
