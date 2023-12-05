<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Handle an incoming request.
     */
    public function handle($request, Closure $next, ...$guard)
    {
        redirect()
            ->setIntendedUrl(url()->current());

        if (!auth()->check()) {
            return redirect('login');
        }

        if (!empty($guard) && auth()->user()->roleutilisateur != $guard[0]) {
            return redirect('login');
        }

        return $next($request);
    }

    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request): ?string
    {
        return $request->expectsJson() ? null : route('login');
    }
}
