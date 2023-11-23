<?php

use App\Http\Controllers\PanierController;
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

Route::get("/panier", [ PanierController::class, 'index' ])
    ->name('panier');

Route::post("/panier/add", [ PanierController::class, 'add' ])
    ->name('doPanierAdd');

Route::post("/panier/remove", [ PanierController::class, 'remove' ])
    ->name('doPanierRemove');

Route::post("/panier/delete", [ PanierController::class, 'delete' ])
    ->name('doPanierDelete');

Route::get("/register", [ UtilisateurController::class, 'register' ])
    ->middleware('guest')
    ->name("register");

Route::post("/register", [ UtilisateurController::class, 'doRegister' ])
    ->middleware('guest')
    ->name("doRegister");

Route::get("/login", [ UtilisateurController::class, 'login' ])
    ->middleware('guest')
    ->name("login");

Route::post("/login", [ UtilisateurController::class, 'doLogin' ])
    ->middleware('guest')
    ->name("doLogin");

Route::get("/account", [ UtilisateurController::class, 'update' ])
    ->middleware('auth')
    ->name("accountUpdate");

Route::post("/account", [ UtilisateurController::class, 'doUpdate' ])
    ->middleware('auth')
    ->name("doAccountUpdate");

Route::get("/logout", [ UtilisateurController::class, 'logout' ])
    ->middleware('auth')
    ->name('logout');

Route::get("/logout", [ UtilisateurController::class, 'logout' ])
    ->middleware('auth')
    ->name('logout');
