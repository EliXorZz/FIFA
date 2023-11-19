@extends('layouts.app')

@section('title', 'Articles')

@section('content')

<div class="flex gap-10 mt-6 px-10">
    <div class="hidden sm:flex flex-col gap-4 pr-7 mt-10 border-r border-black">
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
                    <li class="flex gap-2 items-center">
                        <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" />
                        <p>Rouge</p>
                    </li>
                    <li class="flex gap-2 items-center">
                        <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" />
                        <p>Vert</p>
                    </li>
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
                    <li class="flex gap-2 items-center">
                        <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" />
                        <p>XS</p>
                    </li>
                    <li class="flex gap-2 items-center">
                        <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" />
                        <p>M</p>
                    </li>
                </ul>
            </div>
        </details>
    </div>

    <div class="flex flex-col gap-2 w-full">
        <div class="flex items-center justify-between">
            <p class="text-sm font-light">130 produit(s) trouvé(s)</p>

            <select class="w-72 border-gray-300 text-gray-700 focus:border-gray-300 focus:ring-0">
                <option selected>Trier par</option>
                <option value="prix_croissant">Prix croissant</option>
                <option value="prix_decroissant">Prix décroissant</option>
            </select>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5">
            <div class="shadow-lg divide-y divide-black group cursor-pointer select-none">
                <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-110">
                    <img src="{{ asset('assets/article.png') }}" class="h-full w-full object-contain"/>
                </div>
                <div class="px-7 pt-3 pb-4">
                    <p class="font-medium">FIFA Classics Germany FR '74 Retro T-Shirt – Men's</p>
                    <p class="font-bold">€90.0</p>
                </div>
            </div>
            <div class="shadow-lg divide-y divide-black group cursor-pointer select-none">
                <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-110">
                    <img src="{{ asset('assets/article.png') }}" class="h-full w-full object-contain"/>
                </div>
                <div class="px-7 pt-3 pb-4">
                    <p class="font-medium">FIFA Classics Germany FR '74 Retro T-Shirt – Men's</p>
                    <p class="font-bold">€90.0</p>
                </div>
            </div>
            <div class="shadow-lg divide-y divide-black group cursor-pointer select-none">
                <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-110">
                    <img src="{{ asset('assets/article.png') }}" class="h-full w-full object-contain"/>
                </div>
                <div class="px-7 pt-3 pb-4">
                    <p class="font-medium">FIFA Classics Germany FR '74 Retro T-Shirt – Men's</p>
                    <p class="font-bold">€90.0</p>
                </div>
            </div>
            <div class="shadow-lg divide-y divide-black group cursor-pointer select-none">
                <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-110">
                    <img src="{{ asset('assets/article.png') }}" class="h-full w-full object-contain"/>
                </div>
                <div class="px-7 pt-3 pb-4">
                    <p class="font-medium">FIFA Classics Germany FR '74 Retro T-Shirt – Men's</p>
                    <p class="font-bold">€90.0</p>
                </div>
            </div>
            <div class="shadow-lg divide-y divide-black group cursor-pointer select-none">
                <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-110">
                    <img src="{{ asset('assets/article.png') }}" class="h-full w-full object-contain"/>
                </div>
                <div class="px-7 pt-3 pb-4">
                    <p class="font-medium">FIFA Classics Germany FR '74 Retro T-Shirt – Men's</p>
                    <p class="font-bold">€90.0</p>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
