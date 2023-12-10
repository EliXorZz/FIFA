@extends('layouts.service-vente')

@section('title', "Categorie")

@section('content')
<div class="flex flex-col gap-4">
    <div class="flex flex-col gap-2">
        <h2 class="text-lg font-medium">Information catégorie</h2>

        <form action="{{ route('service-vente.categories.update', ['category' => $categorie]) }}" method="post">
            @csrf
            @method('patch')

            <div class="flex flex-col gap-3">
                <label for="nomcategorieproduit" class="flex flex-col gap-1">
                    Nom catégorie

                    <input
                        type="text"
                        id="nomcategorieproduit"
                        name="nomcategorieproduit"
                        class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                        placeholder="Nom catégorie"
                        value="{{ $categorie->nomcategorieproduit }}"/>

                    @error('nomcategorieproduit')
                        <span class="text-sm text-red-400"> {{ $message }} </span>
                    @enderror
                </label>

                <label class="flex flex-col gap-1">
                    Parent

                    <input hidden name="parentcategorieproduit" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0"
                        @checked($categorie->parentcategorieproduit)/>

                    <input disabled type="checkbox" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0"
                        @checked($categorie->parentcategorieproduit)/>
                </label>

                @if (!$categorie->parentcategorieproduit)
                    <label for="idcategorieproduit" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                        Appartient a une catégorie

                        <select id="idcategorieproduit" name="idcategorieproduit" class="border-black col-span-6 focus:border-black focus:ring-0">
                            @foreach ($parents as $parent)
                                <option value="{{ $parent->idcategorieproduit }}" @selected($parent->idcategorieproduit == $categorie->idcategorieproduit)>{{ $parent->nomcategorieproduit }}</option>
                            @endforeach
                        </select>

                        @error('idsouscategorieproduit')
                            <span class="text-sm text-red-400"> {{ $message }} </span>
                        @enderror
                    </label>
                @endif

                <button type="submit" class="bg-black text-white font-bold w-full py-2 uppercase">
                    Mettre à jour
                </button>

                <form action="{{ route('service-vente.categories.destroy', ['category' => $categorie]) }}" method="post">
                    @csrf
                    @method('delete')

                    <button type="submit" class="bg-red-500 text-white font-bold w-full px-5 py-2 uppercase">
                        Supprimer
                    </button>
                </form>
            </div>
        </form>
    </div>
</div>
@endsection
