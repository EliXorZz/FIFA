@extends('layouts.app')

@section('title', 'Paiement validé')

@section('content')

<div class="px-4 py-8 sm:px-6 sm:py-12 lg:px-8">
    <header class="text-center">
        <h1 class="text-xl font-bold text-gray-900 sm:text-3xl">Paiement validé</h1>
    </header>

    <div class="flex flex-col items-center justify-center gap-6 mt-8">
        <img width="100" src="{{ asset('assets/stripe_success.svg') }}"/>

        <div class="text-center">
            <p class="text-sm text-slate-900">Votre commande à bien été payer et prise en charge</p>
            <a href="{{ route('welcome') }}" class="text-sm text-slate-900 underline">Page d'accueil</a>
        </div>
    </div>
</div>

@endsection
