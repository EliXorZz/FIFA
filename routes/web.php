<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommandeController;
use App\Http\Controllers\ProduitController;
use App\Http\Controllers\PanierController;
use App\Http\Controllers\PublicationController;
use App\Http\Controllers\ServiceExpedition\ServiceExpeditionController;
use App\Http\Controllers\ServiceVente\ServiceVenteCategorieController;
use App\Http\Controllers\ServiceVente\ServiceVenteProduitController;
use App\Http\Controllers\ServiceVente\ServiceVenteVarianteController;
use App\Http\Controllers\UtilisateurController;
use App\Http\Controllers\VoteController;
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

Route::get('/produits/{variantecouleurproduit?}', [ ProduitController::class, 'show' ])
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

// ROUTES SERVICES EXPEDITION;
Route::get('/service-expedition/{typelivraison?}', [ ServiceExpeditionController::class, 'index' ])
    ->middleware(['auth', 'role:service-expedition'])
    ->name('service-expedition');

Route::get('/service-expedition/commande/{commande}', [ ServiceExpeditionController::class, 'commande' ])
    ->middleware(['auth', 'role:service-expedition'])
    ->name('service-expeditionCommande');

Route::post('/service-expedition/commande/{commande}', [ ServiceExpeditionController::class, 'doCommande' ])
    ->middleware(['auth', 'role:service-expedition'])
    ->name('service-expeditionDoCommande');

Route::post('/service-expedition/commande/{commande}/sms', [ ServiceExpeditionController::class, 'doCommandeSMS' ])
    ->middleware(['auth', 'role:service-expedition'])
    ->name('service-expeditionDoCommandeSMS');

// ROUTE SERVICES VENTE
Route::get('/directeur-service-vente', function() {
    return redirect()
        ->route('service-vente');
})->name('directeur-service-vente');

Route::get('/service-vente', function() {
    return redirect()
        ->route('service-vente.produits.index');
})->name('service-vente');

Route::prefix('/service-vente')
    ->middleware(['auth', 'role:service-vente,directeur-service-vente'])
    ->name('service-vente.')
    ->group(function () {
        Route::resources([
            'produits' => ServiceVenteProduitController::class,
            'categories' => ServiceVenteCategorieController::class
        ]);

        Route::resource('produits.variantes', ServiceVenteVarianteController::class)
            ->only(['store', 'update', 'destroy']);

        Route::delete('imageproduits/{imageproduit}', [ ServiceVenteVarianteController::class, 'deleteImage' ])
            ->name('imageproduits');
    }
);

// ROUTES STRIPE
Route::post("/commande/event", [ CommandeController::class, 'event' ]);

Route::post("/commander", [ CommandeController::class, 'doCommande' ])
    ->middleware(['auth', 'verified'])
    ->name('doCommande');

Route::get("/commander/clear", [ CommandeController::class, 'clear' ])
    ->name('commandeClear');

Route::get("/commander/success", [ CommandeController::class, 'success' ])
    ->name('commandeSuccess');

Route::get('/commandes', [ CommandeController::class, 'commandes'])
    ->middleware('auth')
    ->name('commandes');

Route::get('/commande/{commande}', [ CommandeController::class, 'commande' ])
    ->middleware('auth')
    ->name('commande');


// ROUTES THEMES
Route::get("/themevote", [ VoteController::class , 'themevote'])
    ->name('themevotepage');

Route::get("/themevote/{id}", [ VoteController::class , 'selectedtheme' ])
    ->middleware('auth')
    ->name('selectedtheme');

Route::post('/themevote/vote', [ VoteController::class , 'doVote'])
    ->middleware('auth')
    ->name('doVote');

// ROUTES PUBLICATIONS
Route::prefix('publication/')->group(function() {
    Route::get('/', [ PublicationController::class, 'index' ]);

    Route::get('{joueur}', [ PublicationController::class, 'show' ])->name('showPublication');

    Route::get('album/{album}', [ PublicationController::class, 'showAlbum'])->name('showAlbum');

    Route::get('document/{document}', [ PublicationController::class, 'showDocument'])->name('showDocument');

    Route::get('blog/{blog}', [ PublicationController::class, 'showBlog'])->name('showBlog');

    Route::get('article/{article}', [ PublicationController::class, 'showArticle'])->name('showArticle');
})->name('publication.');

