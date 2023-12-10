@extends('layouts.service-vente')

@section('title', "Service vente")

@section('content')

<div class="flex justify-between">
    <input id="search" type="text" placeholder="Rechercher produit" class="text-black w-96 md:w-94 h-10 py-2.5 pe-10 shadow-sm text-sm border-black focus:border-black focus:ring-0" />

    <div class="flex gap-3">
        <div class="flex flex-row-reverse">
            {{ $categories->links() }}
        </div>

        <div class="flex">
            <a href="{{ route('service-vente.categories.create') }}" class="bg-black text-white font-bold w-full px-5 py-2 uppercase">
                Créer
            </a>
        </div>
    </div>
</div>

<table class="border border-1 border-black text-left min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
    <thead class="ltr:text-left rtl:text-right">
        <tr>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                Numéro catégorie
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                Nom catégorie
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                Sous-catégorie
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                Nombre de produit
            </th>
            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900"></th>
        </tr>
    </thead>

    <tbody class="divide-y divide-gray-200">
        @foreach ($categories as $categorie)
            <tr data-href="{{ route('service-vente.categories.show', ['category' => $categorie]) }}" class="hover:cursor-pointer hover:bg-gray-50">
                <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    {{ $categorie->idcategorieproduit }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    {{ $categorie->nomcategorieproduit }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    {{ $categorie->parents->first() ? $categorie->parents->first()->nomcategorieproduit : 'Parent' }}
                </td>
                <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900 bg-gray-50">
                    {{ $categorie->produits->count() }}
                </td>
                <td>
                    <form action="{{ route('service-vente.categories.destroy', ['category' => $categorie]) }}" method="post">
                        @csrf
                        @method('delete')

                        <button type="submit" class="bg-red-500 text-white font-bold w-full px-5 py-2 uppercase">
                            Supprimer
                        </button>
                    </form>
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
