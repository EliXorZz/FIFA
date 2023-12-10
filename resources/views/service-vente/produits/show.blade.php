@extends('layouts.service-vente')

@section('title', "Produit")

@section('content')
<div class="flex flex-col gap-4">
    <div class="flex flex-col gap-2">
        <h2 class="text-lg font-medium">Information produit</h2>

        <form action="{{ route('service-vente.produits.update', ['produit' => $produit]) }}" method="post">
            @csrf
            @method('patch')

            <div class="flex flex-col gap-3">

                <input type="text" name="idproduit" value="{{ $produit->idproduit }}" hidden>

                <label for="titreproduit" class="flex flex-col gap-1">
                    Titre produit

                    <input
                        type="text"
                        id="titreproduit"
                        name="titreproduit"
                        class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                        placeholder="Titre produit"
                        value="{{ $produit->titreproduit }}"/>

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
                        class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0">{{ $produit->descriptionproduit }}</textarea>

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
                                                value="{{ $categorie->idcategorieproduit }}"
                                                @checked($produit->categories->contains('idcategorieproduit', $categorie->idcategorieproduit))/>
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
                                                value="{{ $taille->idtailleproduit }}"
                                                @checked($produit->tailles->contains('idtailleproduit', $taille->idtailleproduit))/>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>

                <button type="submit" class="bg-black text-white font-bold w-full py-2 uppercase">
                    Mettre à jour
                </button>
            </div>
        </form>
    </div>

    <div class="flex flex-col gap-2">
        <h2 class="text-lg font-medium">Variantes produit</h2>

        <div class="flex flex-col gap-3">
            <details>
                <summary class="cursor-pointer">
                    Ajouter une variante
                </summary>


                <form action="{{ route('service-vente.produits.variantes.store', ['produit' => $produit]) }}" method="post" enctype="multipart/form-data">
                    @csrf

                    <div class="flex flex-col gap-3">
                        <input type="text" name="idproduit" value="{{ $produit->idproduit }}" hidden>

                        <label for="idcouleur" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                            Couleur

                            <select id="idcouleur" name="idcouleur" class="border-black col-span-6 focus:border-black focus:ring-0">
                                <option disabled selected>Choisir un couleur</option>

                                @foreach ($couleurs as $couleur)
                                    <option value="{{ $couleur->idcouleur }}">{{ $couleur->nomcouleur }}</option>
                                @endforeach
                            </select>

                            @error('idcouleur')
                                <span class="text-sm text-red-400"> {{ $message }} </span>
                            @enderror
                        </label>

                        <label for="prix" class="flex flex-col gap-1">
                            Prix

                            <input
                                type="number"
                                id="prix"
                                name="prix"
                                class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                                placeholder="Prix"/>

                            @error('prix')
                                <span class="text-sm text-red-400"> {{ $message }} </span>
                            @enderror
                        </label>

                        <div>
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300" for="file_input">
                                Ajouter images
                                <input multiple type="file" name="images[]" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400">
                            </label>
                        </div>

                        <button type="submit" class="bg-black text-white font-bold w-full py-2 uppercase">
                            Créer variante
                        </button>
                    </div>
                </form>
            </details>

            @foreach ($variantes as $variante)
                <details>
                    <summary class="cursor-pointer list-item">
                        <span>Variante ({{ $variante->couleur->nomcouleur }})</span>

                        @if ($variante->prix == null)
                            <span class="text-red-500">[Produit non visible, Aucun prix]</span>
                        @endif
                    </summary>

                    <div class="flex flex-col gap-4">
                        <div>
                            <form action="{{ route('service-vente.produits.variantes.update', ['produit' => $produit, 'variante' => $variante]) }}" method="post" enctype="multipart/form-data">
                                @csrf
                                @method('patch')

                                <input type="text" name="idcouleur" value="{{ $variante->idcouleur }}" hidden>
                                <input type="text" name="idcouleur" value="{{ $variante->idcouleur }}" hidden>

                                <div class="flex flex-col gap-3">
                                    <label for="prix" class="flex flex-col gap-1">
                                        Prix

                                        <input
                                            type="number"
                                            id="prix"
                                            name="prix"
                                            class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                                            placeholder="Prix"
                                            value="{{ $variante->prix }}"/>

                                        @error('prix')
                                            <span class="text-sm text-red-400"> {{ $message }} </span>
                                        @enderror
                                    </label>

                                    <div>
                                        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300" for="file_input">
                                            Ajouter images
                                            <input multiple type="file" name="images[]" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400">
                                        </label>
                                    </div>

                                    <button type="submit" class="bg-black text-white font-bold w-full py-2 uppercase">
                                        Mettre à jour
                                    </button>
                                </div>
                            </form>
                        </div>

                        <div>
                            <form action="{{ route('service-vente.produits.variantes.destroy', ['produit' => $produit, 'variante' => $variante]) }}" method="post">
                                @csrf
                                @method('delete')

                                <input type="text" name="idvariantecouleurproduit" value="{{ $variante->idvariantecouleurproduit }}" hidden>

                                <button type="submit" class="bg-red-500 text-white font-bold w-full py-2 uppercase">
                                    Supprimer
                                </button>
                            </form>
                        </div>

                       <div class="flex flex-wrap gap-4">
                            @foreach ($variante->images as $image)
                                <div>
                                    <form id="deleteImage" action="{{ route('service-vente.imageproduits', ['imageproduit' => $image]) }}" method="post">
                                        @csrf
                                        @method('delete')

                                        <button form="deleteImage" type="submit" class="bg-red-500 text-white font-bold w-full py-2 uppercase opacity-30 hover:opacity-100">
                                            Supprimer
                                        </button>
                                    </form>
                                    <div class="h-48 border border-black divide-y divide-black">
                                        <img src="{{ asset($image->urlimageproduit) }}" class="h-full w-full object-contain"/>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </details>
            @endforeach
        </div>
    </div>
</div>
@endsection
