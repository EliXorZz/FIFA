@extends('layouts.app')

@section('title', 'Produit')

@section('content')

<div class="flex flex-col gap-10 p-10">
    <form action="{{ route('doPanierAddNotify') }}" method="post">
        @csrf

        <div class="flex flex-col gap-10 md:flex-row md:gap-6 justify-around">
            <div class="flex gap-5 w-full md:w-1/2">
                <div id="images" class="flex flex-col gap-6">
                    @forelse ($images as $image)
                        <div class="cursor-pointer transition ease-linear duration-100 delay-75 w-24 h-24 border border-black hover:scale-105">
                            <img src="{{ asset($image->urlimageproduit) }}" class="object-contain"/>
                        </div>
                    @empty
                        <div class="cursor-pointer transition ease-linear duration-100 delay-75 w-24 h-24 border border-black hover:scale-105">
                            <img src="{{ asset('assets/unknow_produit.png') }}" class="object-contain"/>
                        </div>
                    @endforelse
                </div>
                <div class="flex items-center border border-black">
                    <img id="image" class="object-contain object-center"/>
                </div>
            </div>

            <div class="flex flex-col gap-4 border-l-2 border-black px-16 py-10 w-full md:w-1/2">
                <div>
                    <h1 class="font-bold text-lg">{{ $produit->titreproduit }}</h1>
                    <h2 class="font-semibold">€ {{ $selectVariante->prix }}</h2>
                </div>

                <div class="flex flex-col gap-2">
                    <div class="flex gap-1.5">
                        <p class="font-bold">TAILLE :</p>
                        <span class="font-light uppercase">{{ $selectTaille->nomtailleproduit }}</span>
                    </div>
                    <div class="flex gap-3">
                        @foreach ($tailles as $taille)
                            <label id="tailleSelector">
                                <input type="radio" name="selectTaille" class="peer hidden" value="{{ $taille->idtailleproduit }}" @checked($selectTaille->idtailleproduit == $taille->idtailleproduit)/>

                                <p class="cursor-pointer transition ease-linear duration-100 delay-75 font-bold select-none text-black border border-black px-2 py-1.5 hover:text-white hover:bg-black peer-checked:text-white peer-checked:bg-black hover:scale-110">
                                    {{ $taille->nomtailleproduit }}
                                </p>
                            </label>
                        @endforeach
                    </div>
                </div>

                <div class="flex flex-col gap-2">
                    <div class="flex gap-1.5">
                        <p class="font-bold">COULEUR :</p>
                        <span class="font-light uppercase">{{ $selectVariante->couleur->nomcouleur }}</span>
                    </div>
                    <div class="flex gap-3">
                        @foreach ($variantes as $variante)
                            <style>
                                #couleur_{{ $variante->couleur->idcouleur }} {
                                    background: linear-gradient(
                                        -45deg,
                                        #{{ $variante->couleur->hexacouleur }} 0%,
                                        #{{ $variante->couleur->hexacouleur }}99 50%,
                                        #{{ $variante->couleur->hexacouleur }} 100%
                                    );
                                }
                            </style>

                            <label id="varianteSelector">
                                <a href="{{ route('produit', ['variantecouleurproduit' => $variante, 'selectTaille' => $selectTaille->idtailleproduit ]) }}">
                                    <input type="radio" name="selectVariante" class="peer hidden" value="{{ $variante->idvariantecouleurproduit }}" @checked($selectVariante->idvariantecouleurproduit == $variante->idvariantecouleurproduit)/>

                                    <div class="cursor-pointer w-10 h-10 p-px transition ease-linear duration-100 delay-75 flex items-center justify-center peer-checked:border-2 border-black hover:scale-110">
                                        <span id="couleur_{{ $variante->couleur->idcouleur }}" class="select-none border-2 border-black w-full h-full"></span>
                                    </div>
                                </a>
                            </label>
                        @endforeach
                    </div>
                </div>

                <button type="submit" class="transition ease-linear duration-300 delay-75 my-5 font-bold text-white bg-black border-4 border-black py-4 hover:bg-transparent hover:text-black uppercase">Ajouter au panier</button>

                <div>
                    <h3 class="text-lg font-bold">Description</h3>
                    <p>{{ $produit->descriptionproduit }}</p>
                </div>
            </div>
        </div>
    </form>

    <span class="bg-gray-300 h-px"></span>

    <div class="flex flex-col gap-3 overflow-x-auto overflow-y-hidden">
        @if ($produitsSimilaires->isNotEmpty())
            <h2 class="text-lg font-bold">Produit(s) similaires</h2>

            <div class="flex gap-4 max-w-full">
                @foreach ($produitsSimilaires as $produitSimilaire)
                    @foreach ($produitSimilaire->variantes as $variante)
                        <div class="border border-black group cursor-pointer w-96 h-96 flex-shrink-0">
                            <a href="{{ route('produit', ['idvariantecouleurproduit' => $variante]) }}" class="select-none">
                                <div class="h-full transition ease-linear duration-300 delay-75 group-hover:scale-90 relative">
                                    <img src="{{ asset($variante->images->first() != null ? $variante->images->first()->urlimageproduit : 'assets/unknow_produit.png') }}" class="h-full w-full object-contain"/>

                                    <div class="absolute bottom-0 left-0 right-0 px-5 py-2 bg-white bg-opacity-80">
                                        <p class="font-medium text-sm">{{ $produitSimilaire->titreproduit }}</p>
                                        <p class="font-bold text-sm">€{{ $variante->prix }}</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    @endforeach
                @endforeach
            </div>
        @endif
    </div>

    <div class="flex flex-col gap-3 overflow-x-auto overflow-y-hidden">
        @if ($varianteVisites->isNotEmpty())
            <h2 class="text-lg font-bold">Produits visités</h2>

            <div class="flex gap-4 max-w-full">
                @foreach ($varianteVisites->reverse() as $variante)
                    <div class="border border-black group cursor-pointer w-96 h-96 flex-shrink-0">
                        <a href="{{ route('produit', ['idvariantecouleurproduit' => $variante]) }}" class="select-none">
                            <div class="h-full transition ease-linear duration-300 delay-75 group-hover:scale-90 relative">
                                <img src="{{ asset($variante->images->first() != null ? $variante->images->first()->urlimageproduit : 'assets/unknow_produit.png') }}" class="h-full w-full object-contain"/>

                                <div class="absolute bottom-0 left-0 right-0 px-5 py-2 bg-white bg-opacity-80">
                                    <p class="font-medium text-sm">{{ $variante->produit->titreproduit }}</p>
                                    <p class="font-bold text-sm">€{{ $variante->prix }}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                @endforeach
            </div>
        @endif
    </div>

<script>
    const currentImage = document.querySelector('#image')
    const images = document.querySelectorAll('#images img')

    images.forEach(item => {
        item.addEventListener('click', (event) => {
            updateImage(event.target)
        })
    })

    function updateImage(newImage) {
        currentImage.src = newImage.src
    }

    updateImage(images[0])

    const taillesSelector = document.querySelectorAll('#tailleSelector')
    taillesSelector.forEach(selector => {
        selector.addEventListener('click', (event) => {
            const target = event.target
            const location = new URL(window.location.href)

            location.searchParams.set(target.name, target.value)

            window.location.href = location
        })
    })
</script>

@endsection
