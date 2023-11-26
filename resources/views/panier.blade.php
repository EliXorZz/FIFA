@extends('layouts.app')

@section('title', 'Produit')

@section('content')

<div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8">
    <div class="mx-auto max-w-3xl">
        <header class="text-center">
            <h1 class="text-xl font-bold text-gray-900 sm:text-3xl">Mon panier</h1>
        </header>

        <div class="mt-8">
            <ul class="space-y-4">
                @php
                    $subtotal = 0;
                @endphp

                @foreach ($produits as $produit)
                    @php
                        $quantite = $panier->getQuantity($produit->idproduit, $produit->idtailleproduit, $produit->idcouleur);
                        $subtotal += $quantite * $produit->prix;
                    @endphp

                    <li class="flex items-center gap-4">
                        <img src="{{ $produit->images->first()->urlimageproduit }}" class="h-16 w-16 rounded object-cover" />

                        <div>
                            <a href="{{ route('produit', ['produit' => $produit->idproduit, 'selectTaille' => $produit->idtailleproduit, 'selectCouleur' => $produit->idcouleur]) }}"
                                class="text-sm text-gray-900">{{ $produit->titreproduit }}</a>

                            <dl class="mt-0.5 space-y-px text-[10px] text-gray-600">
                                <div>
                                    <dt class="inline">Taille:</dt>
                                    <dd class="inline">{{ $produit->nomtailleproduit }}</dd>
                                </div>

                                <div>
                                    <dt class="inline">Couleur:</dt>
                                    <dd class="inline">{{ $produit->nomcouleur }}</dd>
                                </div>

                                <div>
                                    <dt class="inline text-sm font-medium">Prix:</dt>
                                    <dd class="inline text-sm font-medium">
                                        {{ Illuminate\Support\Number::currency($quantite * $produit->prix, 'EUR') }}
                                    </dd>
                                </div>
                            </dl>
                        </div>

                        <div class="flex flex-1 items-center justify-end gap-2">
                            <div class="flex items-center">
                                <form action="{{ route('doPanierRemove') }}" method="post">
                                    @csrf

                                    <input type="text" name="selectProduit" value="{{ $produit->idproduit }}" hidden/>
                                    <input type="text" name="selectTaille" value="{{ $produit->idtailleproduit }}" hidden/>
                                    <input type="text" name="selectCouleur" value="{{ $produit->idcouleur }}" hidden/>

                                    <button type="submit" class="w-10 h-10 text-black transition hover:opacity-75 border border-black">-</button>
                                </form>

                                <form action="{{ route('doPanierUpdate') }}" method="post">
                                    @csrf

                                    <input type="text" name="idproduit" value="{{ $produit->idproduit }}" hidden/>
                                    <input type="text" name="idtailleproduit" value="{{ $produit->idtailleproduit }}" hidden/>
                                    <input type="text" name="idcouleur" value="{{ $produit->idcouleur }}" hidden/>

                                    <input type="number" name="quantity" value="{{ $quantite }}"
                                        onchange="updateQuantity(this)"
                                        class="h-10 w-16 text-center sm:text-sm bg-transparent focus:outline-none focus:ring-0
                                            [-moz-appearance:_textfield] [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none"/>
                                </form>

                                <form action="{{ route('doPanierAdd') }}" method="post">
                                    @csrf

                                    <input type="text" name="selectProduit" value="{{ $produit->idproduit }}" hidden/>
                                    <input type="text" name="selectTaille" value="{{ $produit->idtailleproduit }}" hidden/>
                                    <input type="text" name="selectCouleur" value="{{ $produit->idcouleur }}" hidden/>

                                    <button type="submit" class="w-10 h-10 text-black transition hover:opacity-75 border border-black">+</button>
                                </form>
                            </div>

                            <form action="{{ route('doPanierDelete') }}" method="post">
                                @csrf

                                <input type="text" name="selectProduit" value="{{ $produit->idproduit }}" hidden/>
                                <input type="text" name="selectTaille" value="{{ $produit->idtailleproduit }}" hidden/>
                                <input type="text" name="selectCouleur" value="{{ $produit->idcouleur }}" hidden/>

                                <button class="text-gray-600 transition hover:text-red-600">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="h-4 w-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </li>
                @endforeach
            </ul>

            @php
                $TVA = 0.2;
                $tva = $subtotal * $TVA;
                $total = $subtotal + $tva;
            @endphp

            @empty($produits)
                <div class="flex flex-col items-center justify-center gap-6">
                    <img width="100" src="{{ asset('assets/order_black.svg') }}"/>

                    <div class="text-center">
                        <p class="text-sm text-slate-900">Vous n'avez aucun article dans votre panier</p>
                        <a href="{{ route('welcome') }}" class="text-sm text-slate-900 underline">Continuez vos achats</a>
                    </div>
                </div>
            @else
                <div class="mt-8 flex justify-end border-t border-gray-100 pt-8">
                    <div class="w-screen max-w-lg space-y-4">
                        <div class="space-y-0.5 text-sm text-gray-700">
                            <div class="flex justify-between">
                                <dt>Sous total</dt>
                                <dd>
                                    {{ Illuminate\Support\Number::currency($subtotal, 'EUR') }}
                                </dd>
                            </div>

                            <div class="flex justify-between">
                                <dt>TVA</dt>
                                <dd>
                                    {{ Illuminate\Support\Number::currency($tva, 'EUR') }}
                                </dd>
                            </div>

                            <div class="flex justify-between text-xl font-bold">
                                <dt>Total</dt>
                                <dd>
                                    {{ Illuminate\Support\Number::currency($total, 'EUR') }}
                                </dd>
                            </div>
                        </div>

                        <div class="flex justify-end">
                            <a href="#" class="bg-black text-white font-bold px-10 py-2 uppercase">
                                Passer commande
                            </a>
                        </div>
                    </div>
                </div>
            @endempty
        </div>
    </div>
</div>

<script>
    function updateQuantity(event) {
        const form = event.parentNode
        form.submit()
    }
</script>

@endsection
