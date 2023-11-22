@extends('layouts.app')

@section('title', 'Produit')

@section('content')

<div class="flex flex-col gap-10 p-10">
    <div class="flex flex-col gap-10 md:flex-row md:gap-6 justify-around">
        <div class="flex gap-5 w-full md:w-1/2">
            <div id="images" class="flex flex-col gap-6">
                @foreach ($images as $image)
                    <div class="cursor-pointer transition ease-linear duration-100 delay-75 w-24 h-24 border border-black hover:scale-105">
                        <img src="{{ $image->urlimageproduit }}" class="object-contain"/>
                    </div>
                @endforeach
            </div>
            <div class="flex items-center border border-black">
                <img id="image" class="object-contain object-center"/>
            </div>
        </div>

        <div class="flex flex-col gap-4 border-l-2 border-black px-16 py-10 w-full md:w-1/2">
            <div>
                <h1 class="font-bold text-lg">{{ $produit->titreproduit }}</h1>
                <h2 class="font-semibold">€ {{ $variantes->first()->pivot->prix }}</h2>
            </div>

            <div class="flex flex-col gap-4">
                <div class="flex gap-1.5">
                    <p class="font-bold">TAILLE :</p>
                    <span class="font-light uppercase">XS</span>
                </div>
                <div class="flex gap-3">
                    @foreach ($tailles as $taille)
                        <label>
                            <input type="radio" name="taille" class="peer hidden"></input>
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
                    <span class="font-light uppercase">ROUGE</span>
                </div>
                <div class="flex gap-3">
                    @foreach ($variantes as $variante)
                        <label>
                            <input type="radio" name="couleur" class="peer hidden"></input>

                            <div class="cursor-pointer w-10 h-10 p-px transition ease-linear duration-100 delay-75 flex items-center justify-center peer-checked:border-2 border-black hover:scale-110">
                                <span class="select-none border-2 border-black bg-gradient-to-r from-red-500 to-red-800 w-full h-full"></span>
                            </div>
                        </label>
                    @endforeach
                </div>
            </div>

            <button class="transition ease-linear duration-300 delay-75 my-5 font-bold text-white bg-black border-4 border-black py-4 hover:bg-transparent hover:text-black uppercase">Ajouter au panier</button>

            <div>
                <h3 class="text-lg font-bold">Description</h3>
                <p>{{ $produit->descriptionproduit }}</p>
            </div>
        </div>
    </div>

    <span class="bg-gray-300 h-px"></span>

    <div class="flex flex-col gap-3">
        @if ($produitsSimilaires->isNotEmpty())
            <h2 class="text-lg font-bold">Produit(s) similaires</h2>

            <div class="flex gap-6 max-w-2xl">
                @foreach ($produitsSimilaires as $produitSimilaire)
                    <div class="border border-black divide-y divide-black group cursor-pointer">
                        <a href="{{ route('produit', ['produit' => $produitSimilaire]) }}" class="select-none">
                            <div class="h-72 transition ease-linear duration-300 delay-75 group-hover:scale-90">
                                <img src="{{ $produitSimilaire->images->first()->urlimageproduit }}" class="h-full w-full object-contain"/>
                            </div>
                            <div class="px-7 pt-3 pb-4">
                                <p class="font-medium">{{ $produitSimilaire->titreproduit }}</p>
                                <p class="font-bold">€{{ $produitSimilaire->prix }}</p>
                            </div>
                        </a>
                    </div>
                @endforeach
            </div>

        @endif
    </div>
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
</script>

@endsection