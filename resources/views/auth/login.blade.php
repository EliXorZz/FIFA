@extends('layouts.base')

@section('bodyClass', 'bg-gradient-to-r from-gray-800 to-gray-600')
@section('body')
<div class="flex items-center justify-center my-14">
    <div class="p-10 bg-white w-96">
        <p class="text-3xl font-bold uppercase">Connexion</p>

        @error('identifiant')
            <span class="text-sm text-red-400"> {{ $message }} </span>
        @enderror

        <form action="{{ route('doLogin') }}" method="post">
            @csrf()

            <div class="flex flex-col gap-2 mt-5">
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
            </div>

            <button type="submit" class="mt-9 bg-black text-white font-bold w-full py-2 uppercase">
                Se connecter
            </button>
        </form>
    </div>
</div>

@endsection
