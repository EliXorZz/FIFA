@extends('layouts.service-vente')

@section('title', "Categorie")

@section('content')
<div class="flex flex-col gap-4">
    <div class="flex flex-col gap-2">
        <h2 class="text-lg font-medium">Information catégorie</h2>

        <form action="{{ route('service-vente.categories.store') }}" method="post">
            @csrf

            <div class="flex flex-col gap-3">
                <label for="nomcategorieproduit" class="flex flex-col gap-1">
                    Nom catégorie

                    <input
                        type="text"
                        id="nomcategorieproduit"
                        name="nomcategorieproduit"
                        class="peer border border-black bg-transparent focus:border-black focus:outline-none focus:ring-0"
                        placeholder="Nom catégorie"/>

                    @error('nomcategorieproduit')
                        <span class="text-sm text-red-400"> {{ $message }} </span>
                    @enderror
                </label>

                <label for="parentcategorieproduit" class="flex flex-col gap-1">
                    Parent

                    <input hidden type="text" name="parentcategorieproduit" value="0">
                    <input id="parentCheck" type="checkbox" name="parentcategorieproduit" value="1" class="cursor-pointer w-4 h-4 border-1 border-black text-black focus:ring-0 focus:ring-offset-0"/>

                    @error('parentcategorieproduit')
                        <span class="text-sm text-red-400"> {{ $message }} </span>
                    @enderror
                </label>

                <label id="categorie" for="idcategorieproduit" class="flex flex-col gap-1 col-span-6 sm:col-span-3">
                    Appartient a une catégorie

                    <select id="idcategorieproduit" name="idcategorieproduit" class="border-black col-span-6 focus:border-black focus:ring-0">
                        <option disabled selected>Appartient a aucune catégorie</option>

                        @foreach ($parents as $parent)
                            <option value="{{ $parent->idcategorieproduit }}">{{ $parent->nomcategorieproduit }}</option>
                        @endforeach
                    </select>

                    @error('idsouscategorieproduit')
                        <span class="text-sm text-red-400"> {{ $message }} </span>
                    @enderror
                </label>

                <button type="submit" class="bg-black text-white font-bold w-full py-2 uppercase">
                    Créer une catégorie
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    const categorie = document.querySelector('#categorie')
    const parentCheck = document.querySelector('#parentCheck')

    parentCheck.addEventListener('click', () => {
        if (parentCheck.checked)
            categorie.classList.add('hidden')
        else
            categorie.classList.remove('hidden')
    })
</script>
@endsection
