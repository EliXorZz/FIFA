@extends('layouts.app')

@section('title', 'Articles')

@section('content')

<div class="flex gap-10 mt-6 px-10">
    <div class="hidden sm:flex flex-col gap-4 w-56 mt-10 border-r border-black">
        <p class="text-xl font-bold uppercase">Filtrer</p>

        <details open id="filtre_couleurs" class="[&_svg]:open:-rotate-0">
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
                            <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" value="{{ $couleur->idcouleur }}" @checked($filtre_couleurs->contains($couleur->idcouleur)) />
                            <p class="whitespace-nowrap">{{ $couleur->nomcouleur }}</p>
                        </li>
                    @endforeach
                </ul>
            </div>
        </details>

        <details open id="filtre_tailles" class="[&_svg]:open:-rotate-0 filter">
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
                            <input type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0" value="{{ $taille->idtailleproduit }}" @checked($filtre_tailles->contains($taille->idtailleproduit)) />
                            <p class="whitespace-nowrap">{{ $taille->nomtailleproduit }}</p>
                        </li>
                    @endforeach
                </ul>
            </div>
        </details>
    </div>

    <div class="flex flex-col gap-2 w-full">
        <div class="flex items-center justify-between">
            <p class="text-sm font-light">{{ $variantes->count() }} produit(s) trouvé(s)</p>

            <select id="order" class="w-72 border-gray-300 text-gray-700 focus:border-gray-300 focus:ring-0">
                <option value="default" @selected(!request()->has('order'))>Tri par défaut</option>
                <option value="asc" @selected(request()->query('order') == 'asc')>Prix croissant</option>
                <option value="desc" @selected(request()->query('order') == 'desc')>Prix décroissant</option>
            </select>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5">
            @foreach ($variantes as $variante)
                <a href="{{ route('produit', ['variantecouleurproduit' => $variante->idvariantecouleurproduit]) }}" class="shadow-lg divide-y divide-black group cursor-pointer select-none">
                    <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-90">
                        <img src="{{ asset($variante->images->first() != null ? $variante->images->first()->urlimageproduit : 'assets/unknow_produit.png') }}" class="h-full w-full object-contain"/>
                    </div>
                    <div class="px-7 pt-3 pb-4">
                        <p class="font-medium">{{ $variante->titreproduit }}</p>
                        <p class="font-bold">€{{ $variante->prix }}</p>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
</div>

<script>
    // ORDER
    const orderSelect = document.querySelector('#order')

    orderSelect.addEventListener('change', (event) => {
        let value = event.target.value

        let location = new URL(window.location.href)

        if (value == 'default')
            location.searchParams.delete('order')
        else
            location.searchParams.set('order', value)

        window.location.href = location
    })

    // FILTRE
    const filtreCouleurs = document.querySelector('#filtre_couleurs')
    const filtreTailles = document.querySelector('#filtre_tailles')

    filtreCouleurs.addEventListener('change', (event) => {
        let couleurs = []

        for (const filtre of filtreCouleurs.querySelectorAll('input'))
            if (filtre.checked)
                couleurs.push(filtre.value)

        let location = new URL(window.location.href)

        if (couleurs.length)
            location.searchParams.set('couleurs', couleurs.join(','))
        else
            location.searchParams.delete('couleurs')

        window.location.href = location
    })

    filtreTailles.addEventListener('change', (event) => {
        let tailles = []

        for (const filtre of filtreTailles.querySelectorAll('input'))
            if (filtre.checked)
                tailles.push(filtre.value)

        let location = new URL(window.location.href)

        if (tailles.length > 0)
            location.searchParams.set('tailles', tailles.join(','))
        else
            location.searchParams.delete('tailles')

        window.location.href = location
    })
</script>

@endsection
