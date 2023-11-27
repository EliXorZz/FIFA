@extends('layouts.app')

@section('content')

<div class="flex flex-col items-center justify-center gap-1 text-center p-20">
    <img width="75" src="{{ asset('assets/mail.svg') }}" class="mb-3"/>

    <h1 class="text-4xl font-bold">Confirmer votre adresse mail</h1>
    <p class="">Merci de confirmer votre adresse mail pour continuer</p>
    <p class="text-slate-800 underline">{{ $mail }}</p>

    <form action="{{ route('doResendVerifyAccount') }}" method="post">
        @csrf

        <button type="submit" class="mt-7 bg-black text-white font-bold px-10 py-2 col-span-6 uppercase">Renvoyer une confirmation</button>
    </form>

    @if(session('send'))
        <p class="text-sm text-slate-800 mt-5">
            {{ session('send') }}
        </p>
    @endif
</div>

@endsection
