<?php

namespace App\Providers;

use App\Historique;
use App\Models\CategorieProduit;
use App\Models\Nation;
use App\Models\TypeLivraison;
use App\Panier;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Stripe\Stripe;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $stripeSecret = config('stripe.secret');

        Stripe::setApiKey($stripeSecret);
        Stripe::setApiVersion('2023-10-16');

        $this->app->singleton(Panier::class, fn () => new Panier());
        $this->app->singleton(Historique::class, fn () => new Historique());
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(Panier $panier): void
    {
        View::share(
            'nations',
            Nation::orderBy('idnation')
        );

        View::share(
            'categories',
            CategorieProduit::with('sousCategories')
                ->orderBy('idcategorieproduit')
        );

        View::share('panier', $panier);

        //-----------------------------------//

        View::share(
            'typeslivraison',
            TypeLivraison::orderBy('idtypelivraison')
        );
    }
}
