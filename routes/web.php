<?php

use App\Http\Controllers\AuthController;
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

// ROUTES PRODUITS
Route::get('/produits', [ ProduitController::class, 'index' ])
    ->name('produits');

Route::get('/produits/{produit}', [ ProduitController::class, 'show' ])
    ->name('produit');

// ROUTES ACCOUNT UPDATE
Route::get('/account', [ UtilisateurController::class, 'index' ])
    ->middleware('auth')
    ->name('account');

Route::post('/account', [ UtilisateurController::class, 'doUpdate' ])
    ->middleware('auth')
    ->name('doAccountUpdate');

// ROUTES REGISTER
Route::get("/register", [ AuthController::class, 'register' ])
    ->middleware('guest')
    ->name("register");

Route::post("/register", [ AuthController::class, 'doRegister' ])
    ->middleware('guest')
    ->name("doRegister");

// ROUTES LOGIN
Route::get("/login", [ AuthController::class, 'login' ])
    ->middleware('guest')
    ->name("login");

Route::post("/login", [ AuthController::class, 'doLogin' ])
    ->middleware('guest')
    ->name("doLogin");

Route::get("/logout", [ AuthController::class, 'logout' ])
    ->middleware('auth')
    ->name('logout');

// ROUTES VERIFY EMAIL
Route::get('/account/verify', [ AuthController::class, 'verify' ])
    ->middleware('auth')
    ->name('verification.notice');

Route::get('/account/verify/{id}/{hash}', [ AuthController::class, 'doVerify' ])
    ->middleware(['auth', 'signed'])
    ->name('verification.verify');

Route::post('/account/verify-resend', [ AuthController::class, 'resendVerify' ])
    ->middleware(['auth','throttle:6,1'])
    ->name('doResendVerifyAccount');

// ROUTES PANIER
Route::get("/panier", [ PanierController::class, 'index' ])
    ->name('panier');

Route::post("/panier/addNotify", [ PanierController::class, 'addNotify' ])
    ->name('doPanierAddNotify');

Route::post("/panier/add", [ PanierController::class, 'add' ])
    ->name('doPanierAdd');

Route::post("/panier/remove", [ PanierController::class, 'remove' ])
    ->name('doPanierRemove');

Route::post("/panier/delete", [ PanierController::class, 'delete' ])
    ->name('doPanierDelete');

Route::post("/panier/update", [ PanierController::class, 'update' ])
    ->name('doPanierUpdate');



