@extends('layouts.app')

@section('title', 'Panier')

@section('content')


<ul>
@foreach($panier->getProduits() as $produitPanier)
    @php
        $produit = \App\Models\Produit::find($produitPanier['idproduit']);
        $couleur = \App\Models\Couleur::find($produitPanier['idcouleur']);
        $taille = \App\Models\TailleProduit::find($produitPanier['idtailleproduit']);
        $photo = $panier->getPhotoProduit($produit->idproduit, $couleur->idcouleur)
        
    @endphp

    <li>
        <img src="{{ $photo }}" alt="{{ $produit->titreproduit }}" style="max-width: 100px;">
        <h3>{{ $produit->titreproduit }}</h3>
        <p>Couleur: {{ $couleur->nomcouleur }}</p>
        <p>Taille: {{ $taille->nomtailleproduit }}</p>
        
        <form action="{{ route('PanierRemove') }}" method="post">
            @csrf
            <input type="text" name="produit" value="{{ $produit->idproduit }}" hidden/>
            <input type="text" name="couleur" value="{{ $couleur->idcouleur }}" hidden/>
            <input type="text" name="taille" value="{{ $taille->idtailleproduit }}" hidden/>

            <button class="transition ease-linear duration-300 delay-75 my-5 font-bold text-white bg-black border-4 border-black py-4 hover:bg-transparent hover:text-black uppercase">Supprimer</button>
        </form>
    </li>
@endforeach

</ul>
<div>
        <h2>Récapitulatif de la commande</h2>
        <ul>
            @php
                $totalprix = 0.0
            @endphp
            @foreach($panier->getProduits() as $produitPanier)
            @php
                $produit = \App\Models\Produit::find($produitPanier['idproduit']);
                $couleur = \App\Models\Couleur::find($produitPanier['idcouleur']);
                $taille = \App\Models\TailleProduit::find($produitPanier['idtailleproduit']);    
                $prix = $panier->getPrixProduit($produit->idproduit, $couleur->idcouleur, $taille->idtailleproduit);
                $totalprix += $prix
            @endphp

                <li>{{ $produit->titreproduit }} - {{$prix;}} €</li>
            @endforeach
        </ul>
        <hr>
        <p>Total : {{$totalprix}}.00 €</p>
        <button class="transition ease-linear duration-300 delay-75 my-5 font-bold text-white bg-black border-4 border-black py-4 hover:bg-transparent hover:text-black uppercase">Payer</button>
</div>

@endsection
