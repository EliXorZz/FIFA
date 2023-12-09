@extends('layouts.service-expedition')

@section('title', "Commande n°$commande->idcommande")

@section('content')

<div data-sms-popup="{{ $commande->idcommande }}" class="hidden absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 bg-gray-200 w-96 p-10 border border-1 border-black">
    <div class="flex flex-col gap-4">
        <h2 class="text-xl font-bold">Envoyer un SMS</h2>

        <form action="{{ route('service-expeditionDoCommandeSMS', [ 'commande' => $commande ]) }}" method="post">
            @csrf

            <label for="message" class="flex flex-col gap-1">
                Message

                <input
                    type="text"
                    name="message"
                    class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                    placeholder="Message texte" />
            </label>

            <div class="flex flex-col gap-3 mt-8">
                <button data-cancel type="button"class="bg-red-600 text-white font-bold w-full py-2 uppercase">
                    Annuler
                </button>

                <button type="submit" class="bg-black text-white font-bold w-full py-2 uppercase">
                    Envoyer
                </button>
            </div>
        </form>
    </div>
</div>

<div class="flex flex-col gap-3">
    <h2>Informations</h2>

    <table class="border border-1 border-black text-left min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
        <thead class="ltr:text-left rtl:text-right">
            <tr>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    Numéro commande
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Adresse livraison
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Adresse facturation
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Quantité total
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Status
                </th>
            </tr>
        </thead>

        <tbody class="divide-y divide-gray-200">
            <tr>
                <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    {{ $commande->idcommande }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                    {{ $commande->ruelivraisoncmd }},  {{ $commande->postallivraisoncmd }} {{ $commande->villelivraisoncmd }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                    {{ $commande->ruefacturationcmd }},  {{ $commande->postalfacturationcmd }} {{ $commande->villefacturationcmd }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                    {{ $quantite }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                    @if ($commande->expeditioncmd)
                        <span class="whitespace-nowrap rounded-full bg-green-100 px-2.5 py-0.5 text-sm text-green-700">
                            Expediée
                        </span>
                    @else
                        <span class="whitespace-nowrap rounded-full bg-yellow-100 px-2.5 py-0.5 text-sm text-yellow-700">
                            En préparation
                        </span>
                    @endif
                </td>
            </tr>
        </tbody>
    </table>
</div>

@if ($commande->expeditioncmd)
    <button data-sms="{{ $commande->idcommande }}" class="inline-block rounded bg-green-600 px-4 py-2 text-xs font-bold text-white w-full">
        ENVOYER UN SMS
    </button>
@else
    <form action="{{ route('service-expeditionDoCommande', [ 'commande' => $commande ]) }}" method="post">
        @csrf

        <button type="submit" class="inline-block rounded bg-black px-4 py-2 text-xs font-bold text-white hover:bg-black-500 w-full">
            VALIDER COMMANDE
        </button>
    </form>
@endif

<div class="flex flex-col gap-3">
    <h2>Produits</h2>

    <table class="border border-1 border-black text-left min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
        <thead class="ltr:text-left rtl:text-right">
            <tr>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    Numéro produit
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Nom produit
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Couleur produit
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Taille produit
                </th>
                <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                    Quantité produit
                </th>
            </tr>
        </thead>

        <tbody class="divide-y divide-gray-200">
            @foreach ($lignes as $ligne)
                <tr data-href="{{ route('produit', ['variantecouleurproduit' => $ligne->variante, 'selectTaille' => $ligne->taille->idtailleproduit]) }}" class="hover:cursor-pointer hover:bg-gray-50">
                    <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                        {{ $ligne->variante->idproduit }}
                    </td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ $ligne->variante->produit->titreproduit }}
                    </td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ $ligne->variante->couleur->nomcouleur }}
                    </td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ $ligne->taille->nomtailleproduit }}
                    </td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                        {{ $ligne->quantitecommande }}
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>

@endsection
