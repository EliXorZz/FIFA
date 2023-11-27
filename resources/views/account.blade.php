@extends('layouts.app')

@section('content')
<div class="flex items-center justify-center my-14">
    <div class="p-10 bg-white">
        <div class="flex items-center justify-between mb-5">
            <p class="text-3xl font-bold uppercase">Mes informations</p>
            <a href="{{ url()->full() }}" class="top-0 right-0">Réinitialiser mes informations</a>
        </div>

        <form action="{{ route('doAccountUpdate') }}" method="post" class="grid grid-cols-6 gap-3">
            @csrf()

            <label for="prenomutilisateur" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                Prénom

                <input
                    type="text"
                    id="prenomutilisateur"
                    name="prenomutilisateur"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Prénom"
                    value="{{ $prenomutilisateur }}"/>

                @error('prenomutilisateur')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="surnomutilisateur" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                Nom d'utilisateur

                <input
                    type="text"
                    id="surnomutilisateur"
                    name="surnomutilisateur"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Nom d'utilisateur"
                    value="{{ $surnomutilisateur }}"/>

                @error('surnomutilisateur')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="mailutilisateur" class="flex flex-col gap-1 col-span-6">
                <div class="flex items-center gap-2">
                    <p>Adresse mail</p>

                    @if($verified)
                        <img src="assets/yescheckmark.svg" width="18"  title="Verifier" />
                    @else
                        <img src="assets/nocheckmark.svg" width="18"  title="Non Verifier" />
                    @endif

                </div>

                <input
                    type="text"
                    id="mailutilisateur"
                    name="mailutilisateur"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Adresse mail"
                    value="{{   $mailutilisateur }}"/>

                @error('mailutilisateur')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="idlangue" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                Langue

                <select id="idlangue" name="idlangue" class="border-black col-span-6 focus:border-black focus:ring-0">
                    <option disabled selected>Choisir une langue</option>
                    @foreach ($langues as $item)
                        <option value="{{$item->idlangue}}" @selected( $idlangue == $item->idlangue)>{{ $item->nomlangue }}</option>
                    @endforeach
                </select>

                @error('idlangue')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="datenaissance" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                Date naissance

                <input
                    type="date"
                    id="datenaissance"
                    name="datenaissance"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Date de naissance"
                    value="{{ $datenaissance }}"/>

                @error('datenaissance')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="idpays" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                Pays de naissance

                <select id="idpays" name="idpays" class="border-black col-span-6 sm:col-span-3 focus:border-black focus:ring-0">
                    <option disabled selected>Choisir un pays de naissance</option>
                    @foreach ($pays as $item)
                        <option value="{{$item->idpays}}" @selected($idpays == $item->idpays)>{{ $item->nompays }}</option>
                    @endforeach
                </select>

                @error('idpays')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <label for="idpaysfavori" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                Pays favori

                <select id="idpaysfavori" name="idpaysfavori" class="border-black col-span-6 sm:col-span-3 focus:border-black focus:ring-0">
                    <option disabled selected>Choisir un pays favori</option>
                    @foreach ($pays as $item)
                        <option value="{{$item->idpays}}" @selected($idpaysfavori == $item->idpays)>{{ $item->nompays }}</option>
                    @endforeach
                </select>

                @error('idpaysfavori')
                    <span class="text-sm text-red-400"> {{ $message }} </span>
                @enderror
            </label>

            <button type="submit" class="mt-6 bg-black text-white font-bold px-10 py-2 col-span-6 uppercase">
                Mettre à jour mes informations
            </button>
        </form>
    </div>
</div>

@endsection
