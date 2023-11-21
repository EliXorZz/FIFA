@extends('layouts.base')

@section('body')
<div class="flex items-center justify-center h-screen bg-gradient-to-r from-gray-800 to-gray-600">
    <div class="p-10 bg-white">
        <p class="mb-5 text-3xl font-bold">Inscription</p>

        <form action="{{ route('register') }}" method="post" class="grid grid-cols-6 gap-2">
            @csrf()

            <label for="prenomutilisateur" class="flex flex-col gap-1 col-span-3">
                Prénom

                <input
                    type="text"
                    id="prenomutilisateur"
                    name="prenomutilisateur"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Prénom"
                    value="{{ old('prenomutilisateur') }}"/>

                @error('prenomutilisateur')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="surnomutilisateur" class="flex flex-col gap-1 col-span-3">
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

            <label for="mailutilisateur" class="flex flex-col gap-1 col-span-6">
                Adresse mail

                <input
                    type="text"
                    id="mailutilisateur"
                    name="mailutilisateur"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Adresse mail"
                    value="{{ old('mailutilisateur') }}"/>

                @error('mailutilisateur')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="idlangue" class="flex flex-col gap-1 col-span-3">
                Langue

                <select id="idlangue" name="idlangue" class="border-black col-span-6 focus:border-black focus:ring-0">
                    <option disabled selected>Choisir une langue</option>
                    @foreach ($langues as $item)
                        <option value="{{$item->idlangue}}" @selected(old('idlangue') == $item->idlangue)>{{ $item->nomlangue }}</option>
                    @endforeach
                </select>

                @error('idlangue')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="datenaissance" class="flex flex-col gap-1 col-span-3">
                Date naissance

                <input
                    type="date"
                    id="datenaissance"
                    name="datenaissance"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Date de naissance"
                    value="{{ old('datenaissance') }}"/>

                @error('datenaissance')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="idpays" class="flex flex-col gap-1 col-span-3">
                Pays de naissance

                <select id="idpays" name="idpays" class="border-black col-span-3 focus:border-black focus:ring-0">
                    <option disabled selected>Choisir un pays de naissance</option>
                    @foreach ($pays as $item)
                        <option value="{{$item->idpays}}" @selected(old('idpays') == $item->idpays)>{{ $item->nompays }}</option>
                    @endforeach
                </select>

                @error('idpays')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="idpaysfavori" class="flex flex-col gap-1 col-span-3">
                Pays favori

                <select id="idpaysfavori" name="idpaysfavori" class="border-black col-span-3 focus:border-black focus:ring-0">
                    <option disabled selected>Choisir un pays favori</option>
                    @foreach ($pays as $item)
                        <option value="{{$item->idpays}}" @selected(old('idpaysfavori') == $item->idpays)>{{ $item->nompays }}</option>
                    @endforeach
                </select>

                @error('idpaysfavori')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="motpasse" class="flex flex-col gap-1 col-span-3">
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

            <label for="motpasse_confirmation" class="flex flex-col gap-1 col-span-3">
                Confirmation mot de passe

                <input
                    type="password"
                    id="motpasse_confirmation"
                    name="motpasse_confirmation"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Confirmation mot de passe"/>

                @error('motpasse_confirmation')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <button type="submit" class="mt-6 bg-black text-white font-bold px-10 py-2 col-span-6 uppercase">
                Valider
            </button>
        </form>
    </div>
</div>

@endsection
