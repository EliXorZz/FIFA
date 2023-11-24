<?php

use App\Http\Controllers\ProduitController;
use App\Http\Controllers\UtilisateurController;

use Illuminate\Support\Facades\Route;

use Illuminate\Foundation\Auth\EmailVerificationRequest;

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

    Route::get("/account", [ UtilisateurController::class, 'update' ])
    ->middleware(['auth','verified'])
    ->name("accountUpdate");

Route::post("/account", [ UtilisateurController::class, 'doUpdate' ])
    ->middleware(['auth','verified'])
    ->name("doAccountUpdate");

Route::get("/logout", [ UtilisateurController::class, 'logout' ])
    ->middleware('auth')
    ->name('logout');

Route::get('/account/verify-email', [ UtilisateurController::class, 'verify' ])
    ->middleware('auth')
    ->name('verification.notice');

Route::get('/account/verify-email/{id}/{hash}', [ UtilisateurController::class, 'doVerify' ])
    ->middleware(['auth', 'signed'])
    ->name('verification.verify');

Route::post('/account/verify-email-resend/', [ UtilisateurController::class, 'resendVerify' ])
    ->middleware(['auth','throttle:6,1'])
    ->name('verification.send');

