<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Role
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, ... $guard): Response
    {
        redirect()
            ->setIntendedUrl(url()->current());

        if (auth()->check() && !empty($guard) && auth()->user()->roleutilisateur != $guard[0]) {
            return redirect('login');
        }

        return $next($request);
    }
}
