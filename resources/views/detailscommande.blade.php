@extends('layouts.app')

@section('title', 'detailsCommande')

@section('content')
    <div class="flex flex-col gap-3 mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8">
        <h1 class="m-4 text-xl font-bold text-gray-900 sm:text-3xl">Détails de la commande #{{ $commande->idcommande }}</h1>
        <table class="border border-1 border-black text-left min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
            <thead class="ltr:text-left rtl:text-right">
                <tr>
                    <th class=" bg-black text-white whitespace-nowrap px-4 py-2 font-medium ">

                    </th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-white bg-black">
                        Produit
                    </th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-white bg-black">
                        Taille
                    </th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-white bg-black">
                        Couleur
                    </th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-white bg-black">
                        Quantité
                    </th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-white bg-black">
                        Prix unitaire
                    </th>
                </tr>
            </thead>
            @php
             $subtotal = 0
            @endphp
            <p class=" flex justify-end">Total de la commande : {{ $quantite }} produits</p>

            <tbody class="divide-y divide-gray-200">
                @foreach($produits as $produit)
                    <tr data-href="{{ route('produit', ['produit' => $produit->idproduit, 'selectTaille' => $produit->idtailleproduit, 'selectCouleur' => $produit->idcouleur]) }}" class="hover:cursor-pointer hover:bg-gray-50">
                        <td></td>
                        <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                            {{ $produit->titreproduit }}
                        </td>
                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                            {{ $produit->nomtailleproduit }}
                        </td>
                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                            {{ $produit->nomcouleur }}
                        </td>
                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                            {{ $produit->quantitecommande }}
                        </td>
                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                            {{ $produit->prixunitaire }}
                        </td>
                    </tr>

                    @php
                        $subtotal +=  $produit->prixunitaire 
                    @endphp
                @endforeach

                @php
                    $TVA = 0.2;
                    $tva = $subtotal * $TVA;
                    $total = $subtotal + $tva;
                @endphp

                <tr class="text-xs border-t">
                    <td colspan="4" class="whitespace-nowrap px-4 py-2 text-gray-900 bg-gray-50">
                        Sous Total :
                    </td>
                    <td></td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ Illuminate\Support\Number::currency($subtotal, 'EUR') }}
                    </td> 
                 </tr>
                 <tr class="text-xs">
                    <td colspan="4" class="whitespace-nowrap px-4 py-2 text-gray-900 bg-gray-50">
                        TVA :
                    </td>
                    <td></td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ Illuminate\Support\Number::currency($tva, 'EUR') }}
                    </td> 
                 </tr>
                 <tr class="text-mborder-t">
                    <td colspan="4" class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                        TOTAL :
                    </td>
                    <td></td>
                    <td class=" font-bold whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ Illuminate\Support\Number::currency($total, 'EUR') }}
                    </td> 
                 </tr>
            </tbody>

        </table>

        <table class="p-10 border border-black text-left divide-y-2 bg-white text-sm mt-4 max-w-2xl">
            <tbody class="divide-y divide-gray-200">
                <tr>
                    <td class="font-bold whitespace-nowrap px-4 py-2 text-gray-700">Type de livraison :</td>
                    <td class="font-medium whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ $commande->typeLivraison()->first()->nomlivraison }}
                    </td>
                </tr>
                <tr>
                    <td class="font-bold whitespace-nowrap px-4 py-2 text-gray-700">Status Commande :</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        @if ($commande->expeditioncmd)
                            <span class="whitespace-nowrap rounded-full bg-green-100 px-2.5 py-0.5 text-sm text-green-700">Expediée</span>
                        @else
                            <span class="whitespace-nowrap rounded-full bg-yellow-100 px-2.5 py-0.5 text-sm text-yellow-700">En préparation</span>
                        @endif
                    </td>
                </tr>
            </tbody>
        </table>


    </div>
@endsection
