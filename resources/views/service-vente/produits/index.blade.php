@extends('layouts.service-vente')

@section('title', "Service vente")

@section('content')

<div class="flex justify-between">
    <input id="search" type="text" placeholder="Rechercher produit" class="text-black w-96 md:w-94 h-10 py-2.5 pe-10 shadow-sm text-sm border-black focus:border-black focus:ring-0" />

    <div class="flex gap-3">
        <div class="flex flex-row-reverse">
            {{ $produits->links() }}
        </div>

        <div class="flex">
            <a href="{{ route('service-vente.produits.create') }}" class="bg-black text-white font-bold w-full px-5 py-2 uppercase">
                Créer
            </a>
        </div>
    </div>
</div>

<table class="border border-1 border-black text-left min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
    <thead class="ltr:text-left rtl:text-right">
        <tr>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                Numéro produit
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                Titre produit
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                Couleurs
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                Nombre de taille
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                Variante sans prix
            </th>
        </tr>
    </thead>

    <tbody class="divide-y divide-gray-200">
        @foreach ($produits as $produit)
            @php
                $variantes = $produit->variantes;

                $count = $variantes
                    ->where('prix', null)
                    ->count();

                $success = auth()->user()->roleutilisateur != 'directeur-service-vente' || ($count == 0 && $variantes->isNotEmpty());
            @endphp

            <tr data-href="{{ route('service-vente.produits.show', ['produit' => $produit]) }}" class="hover:cursor-pointer hover:bg-gray-50">
                <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    {{ $produit->idproduit }}
                </td>
                @if ($success)
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ $produit->titreproduit }}
                    </td>
                @else
                    <td class="whitespace-nowrap px-4 py-2 text-red-500">
                        {{ $produit->titreproduit }}
                    </td>
                @endif
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                    <div class="flex gap-px">
                        @foreach ($produit->variantes as $variante)
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

                            <div class="w-5 h-5 p-px transition ease-linear duration-100 delay-75 flex items-center justify-center hover:scale-110">
                                <span id="couleur_{{ $variante->couleur->idcouleur }}" class="rounded-full select-none border border-black w-full h-full"></span>
                            </div>
                        @endforeach
                    </div>
                </td>
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                    {{ $produit->tailles->count() }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                    @if ($success)
                        <p class="font-bold text-green-500">{{ $count }} </p>
                    @else
                        <p  class="font-bold text-red-500">{{ $count }} </p>
                    @endif
                </td>
            </tr>
        @endforeach
    </tbody>
</table>

<script>
    const search = document.querySelector('#search')

    search.addEventListener('keypress', (event) => {
        if (event.key === 'Enter') {
            const value = event.target.value
            const location = new URL(window.location.href)

            location.searchParams.set('search', value.split(' ').join(','))

            window.location.href = location
        }
    })
</script>

@endsection
