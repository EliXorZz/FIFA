@extends('layouts.base')

@section('body')
<header>
    <div class="bg-neutral-950 text-white w-full h-16 flex items-center justify-around">
        <a href="{{ route('welcome') }}">
            <img src="{{ asset('assets/logo.svg') }}" />
        </a>

        <div class="relative hidden sm:block">
            <input id="search" type="text" placeholder="Rechercher des produits" class="border-white text-black w-96 md:w-94 h-10 py-2.5 pe-10 shadow-sm text-sm border-transparent focus:border-transparent focus:ring-0" />

            <span class="absolute inset-y-0 end-0 grid w-10 place-content-center">
                <button type="button" class="text-gray-600 hover:text-gray-700">
                    <img src="{{ asset('assets/search.svg') }}" />
                </button>
            </span>
        </div>

        <div class="flex gap-10">
            <div class="hidden md:flex items-center gap-3">
                <div class="flex flex-col text-left leading-tight tracking-wider">
                    @auth
                        <a href="{{ route('logout') }}">
                            <p class="font-medium text-sm">BIENVENUE</p>
                            <p class="font-light text-xs"> {{ auth()->user()->prenomutilisateur }} </p>
                        </a>
                    @else
                        <a href="{{ route('login') }}" class="font-medium text-sm">CONNEXION</a>
                        <a href="{{ route('register') }}" class="font-light text-xs">INSCRIPTION</a>
                    @endauth
                </div>
                <div>
                    <img src="{{ asset('assets/user.svg') }}" class="object-contain" />
                </div>
            </div>
            <div class="flex items-center gap-3">
                <div class="text-left leading-tight tracking-wider">
                    <p class="font-medium text-sm">MON PANIER</p>
                    <p class="font-light text-xs">
                        <a href="{{ route('panier') }}">Voir mon panier</a>
                    </p>
                </div>
                <div class="relative">
                    <a href="{{ route('panier') }}">
                        <img src="{{ asset('assets/order.svg') }}" class="object-contain" />
                        <div
                            class="bg-red-500 rounded-full absolute -top-2 -right-2 w-4 h-4 flex items-center justify-center">
                            <span class="text-xs">{{ $panier->getTotalQuantity() }}</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <nav class="relative bg-neutral-900 text-white h-10">
        <ul class="flex gap-10 items-center justify-center h-full uppercase select-none">
            <li class="h-full" >
                <div class="cursor-pointer flex items-center justify-center px-5 h-full hover:bg-neutral-700">
                    Nations
                </div>

                <div data-menu class="z-10 hidden data-[state=on]:flex gap-20 items-center w-full min-h-72 bg-gray-50 text-black shadow-inner absolute top-10 left-0 normal-case">
                    <div class="flex gap-28 ml-14 py-6">
                        <div class="w-full">
                            <p>Produit(s) des nations</p>
                            <div class="bg-black w-full h-px mt-1"></div>

                            <ul class="columns-8 gap-4 text-slate-800 mt-3 leading-loose">
                                @foreach ($nations->get() as $nation)
                                    <li>
                                        <a href="{{ route('produits', ['nation' => $nation->idnation]) }}" class="hover:underline">{{ $nation->nomnation }}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </li>

            @foreach ($categories->get() as $categorie)
                @if($categorie->parentcategorieproduit)
                    <li class="h-full">
                        <a href="{{ route('produits', ['categorie' => $categorie->idcategorieproduit]) }}" class="flex items-center justify-center px-5 h-full hover:bg-neutral-700">
                            {{ $categorie->nomcategorieproduit }}
                        </a>

                        @if($categorie->sousCategories->isNotEmpty())
                            <div data-menu class="z-10 hidden data-[state=on]:flex gap-20 items-center w-full min-h-72 bg-gray-50 text-black shadow-inner absolute top-10 left-0 normal-case">
                                <div class="flex gap-28 ml-14 py-6">
                                    <div class="w-full">
                                        <p>{{ $categorie->nomcategorieproduit }} sous catégorie(s)</p>
                                        <div class="bg-black w-full h-px mt-1"></div>

                                        <ul class="columns-2 gap-4 text-slate-800 mt-3 leading-loose">
                                            @foreach ($categorie->sousCategories as $sousCategorie)
                                                <li>
                                                    <a href="{{ route('produits', ['categorie' => $sousCategorie->idcategorieproduit]) }}" class="hover:underline">
                                                        {{ $sousCategorie->nomcategorieproduit }}
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </li>
                @endif
            @endforeach
        </ul>
    </nav>
</header>

<main>
    @yield('content')
</main>

<script>
    const items = document.querySelectorAll('header > nav > ul > li')
    let current

    items.forEach(item => {
        item.addEventListener('mouseenter', (event) => {
            target = item.querySelector('div[data-menu]')

            if (target == null)
                return

            if (current != null && current != target)
                delete current.dataset.state

            if (target.dataset.state)
                delete target.dataset.state
            else
                target.dataset.state = 'on'
                current = target
        })

        item.addEventListener('mouseleave', (event) => {
            target = item.querySelector('div[data-menu]')

            if (target == null)
                return

            if (current == target)
                delete current.dataset.state
        })
    })

    const search = document.querySelector('#search')
    search.addEventListener('keypress', (event) => {
        if (event.key === 'Enter') {
            const value = event.target.value
            const location = new URL(@json(route('produits')))

            location.searchParams.set('search', value.split(' ').join(','))

            window.location.href = location
        }
    })
</script>
@endsection
