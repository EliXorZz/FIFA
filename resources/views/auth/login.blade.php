@extends('layouts.base')

@section('bodyClass', 'bg-gradient-to-r from-gray-800 to-gray-600')
@section('body')
<div class="flex items-center justify-center my-14">
    <div class="p-10 bg-white">
        <p class="mb-5 text-3xl font-bold uppercase">Connexion</p>

        <form action="{{ route('doLogin') }}" method="post" class="gap-3">
            @csrf()

            @error('identifiant')
                <span class="text-sm text-red-400"> {{ $message }} </span>
            @enderror

            <label for="surnomutilisateur" class="flex flex-col gap-1">
                Nom d'utilisateur

                <input
                    type="text"
                    id="surnomutilisateur"
                    name="surnomutilisateur"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Nom d'utilisateur"
                    value="{{ old('surnomutilisateur') }}"/>

                @error('surnomutilisateur')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="motpasse" class="flex flex-col gap-1">
                Mot de passe

                <input
                    type="password"
                    id="motpasse"
                    name="motpasse"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Mot de passe"/>

                @error('motpasse')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <button type="submit" class="mt-6 bg-black text-white font-bold w-full py-2 uppercase">
                Valider
            </button>
        </form>
    </div>
</div>

@endsection
