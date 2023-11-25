<?php

namespace App\Providers;

use App\Models\CategorieProduit;
use App\Models\Nation;
use App\Panier;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
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
