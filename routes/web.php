<?php

use App\Http\Controllers\ProduitController;
use App\Http\Controllers\PanierController;
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

Route::get("/login", [ UtilisateurController::class, 'login' ])
    ->middleware('guest')
    ->name("login");

Route::post("/login", [ UtilisateurController::class, 'doLogin' ])
    ->middleware('guest')
    ->name("doLogin");


Route::get("/panier", [ PanierController::class, 'show' ])
    ->name("Panier");

Route::post("/panier/add", [PanierController::class, 'addPanier'])
    ->name("PanierAdd");

Route::post("/panier/remove", [PanierController::class, 'removePanier'])
    ->name("PanierRemove");

Route::post("/panier/remove1", [PanierController::class, 'remove1Panier'])
    ->name("Panier1Remove");

Route::post("/panier/add1", [PanierController::class, 'add1Panier'])
    ->name("Panier1Add");

Route::post('/updateQuantite', [PanierController::class, 'updateQuantite'])
    ->name('updateQuantite');



