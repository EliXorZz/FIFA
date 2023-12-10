@extends('layouts.service-vente')

@section('title', "Produit")

@section('content')
<div class="flex flex-col gap-4">
    <div class="flex flex-col gap-2">
        <h2 class="text-lg font-medium">Information produit</h2>

        <form action="{{ route('service-vente.produits.store') }}" method="post">
            @csrf

            <div class="flex flex-col gap-3">
                <label for="titreproduit" class="flex flex-col gap-1">
                    Titre produit

                    <input
                        type="text"
                        id="titreproduit"
                        name="titreproduit"
                        class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                        placeholder="Titre produit"/>

                    @error('titreproduit')
                        <span class="text-sm text-red-400"> {{ $message }} </span>
                    @enderror
                </label>

                <label for="descriptionproduit" class="flex flex-col gap-1">
                    Description produit

                    <textarea
                        type="text"
                        id="descriptionproduit"
                        name="descriptionproduit"
                        class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"></textarea>

                    @error('descriptionproduit')
                        <span class="text-sm text-red-400"> {{ $message }} </span>
                    @enderror
                </label>

                <div class="flex flex-col gap-3">
                    <div class="flex justify-between items-center">
                        <p>Catégories</p>
                    </div>

                    <div class="h-96 overflow-auto">
                        <table class="border border-1 border-black text-left min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
                            <thead class="ltr:text-left rtl:text-right">
                                <tr>
                                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                                        Numéro catégorie
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                        Nom catégorie
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900"></th>
                                </tr>
                            </thead>

                            <tbody class="divide-y divide-gray-200">
                                @foreach ($categories as $categorie)
                                    <tr class="hover:cursor-pointer hover:bg-gray-50">
                                        <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                                            {{ $categorie->idcategorieproduit }}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            {{ $categorie->nomcategorieproduit }}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            <input type="checkbox" name="categories[]" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0"
                                                value="{{ $categorie->idcategorieproduit }}"/>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="flex flex-col gap-3">
                    <div class="flex justify-between items-center">
                        <p>Tailles</p>
                    </div>

                    <div class="h-96 overflow-auto">
                        <table class="border border-1 border-black text-left min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
                            <thead class="ltr:text-left rtl:text-right">
                                <tr>
                                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                                        Numéro taille
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                        Nom taille
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900"></th>
                                </tr>
                            </thead>

                            <tbody class="divide-y divide-gray-200">
                                @foreach ($tailles as $taille)
                                    <tr class="hover:cursor-pointer hover:bg-gray-50">
                                        <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                                            {{ $taille->idtailleproduit }}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            {{ $taille->nomtailleproduit }}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            <input type="checkbox" name="tailles[]" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0"
                                                value="{{ $taille->idtailleproduit }}"/>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>

                <button type="submit" class="bg-black text-white font-bold w-full py-2 uppercase">
                    Créer le produit
                </button>
            </div>
        </form>
    </div>
</div>
@endsection
