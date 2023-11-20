@extends('layouts.app')

@section('title', 'Articles')

@section('content')

<div class="flex gap-10 mt-6 px-10">
    <div class="hidden sm:flex flex-col gap-4 w-56 mt-10 border-r border-black">
        <p class="text-xl font-bold uppercase">Filtrer</p>

        <details class="[&_svg]:open:-rotate-0">
            <summary class="cursor-pointer flex gap-3 list-none items-center font-bold uppercase">
                <p>
                    Couleur
                </p>

                <svg class="-rotate-90 transform transition-all duration-300" fill="none" height="20" width="20" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </summary>

            <div>
                <ul class="mt-2 gap-2 leading-loose">
                    @foreach ($couleurs as $couleur)
                        <li class="flex gap-2 items-center">
                            <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" />
                            <p class="whitespace-nowrap">{{ $couleur->nomcouleur }}</p>
                        </li>
                    @endforeach
                </ul>
            </div>
        </details>

        <details class="[&_svg]:open:-rotate-0">
            <summary class="cursor-pointer flex gap-3 list-none items-center font-bold uppercase">
                <p>
                    Taille
                </p>

                <svg class="-rotate-90 transform transition-all duration-300" fill="none" height="20" width="20" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </summary>

            <div>
                <ul class="mt-2 gap-2 leading-loose">
                    @foreach ($tailles as $taille)
                        <li class="flex gap-2 items-center">
                            <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" />
                            <p class="whitespace-nowrap">{{ $taille->nomtailleproduit }}</p>
                        </li>
                    @endforeach
                </ul>
            </div>
        </details>
    </div>

    <div class="flex flex-col gap-2 w-full">
        <div class="flex items-center justify-between">
            <p class="text-sm font-light">{{ $produits->count() }} produit(s) trouvé(s)</p>

            <select class="w-72 border-gray-300 text-gray-700 focus:border-gray-300 focus:ring-0">
                <option selected>Trier par</option>
                <option value="asc">Prix croissant</option>
                <option value="desc">Prix décroissant</option>
            </select>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5">
            @foreach ($produits as $produit)
                <div class="shadow-lg divide-y divide-black group cursor-pointer select-none">
                    <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-110">
                        <img src="{{ asset('assets/produit.png') }}" class="h-full w-full object-contain"/>
                    </div>
                    <div class="px-7 pt-3 pb-4">
                        <p class="font-medium">{{ $produit->titreproduit }}</p>
                        <p class="font-bold">€{{ $produit->prix }}</p>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>

@endsection
