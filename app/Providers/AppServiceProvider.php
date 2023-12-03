<?php

namespace App\Providers;

use App\Models\CategorieProduit;
use App\Models\Nation;
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
        $stripeSecret = env('STRIPE_SECRET');

        Stripe::setApiKey($stripeSecret);
        Stripe::setApiVersion('2023-10-16');

        $this->app->singleton(Panier::class, fn () => new Panier());
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
    }
}
