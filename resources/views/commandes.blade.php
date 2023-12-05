<!-- resources/views/commandes.blade.php -->

@extends('layouts.app')

@section('content')
    <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8">
        <div class="mx-auto max-w-3xl">
            <header class="text-center">
                <h1 class="text-xl font-bold text-gray-900 sm:text-3xl">Listes des commandes</h1>
            </header>
            <div class="mt-8">
                @foreach ($commandes as $commande)
                    <div class="mb-8">
                        <div class="border-2 border-black rounded p-6 flex items-center">
                            <div class="w-1/2">  
                                <p>
                                    <span class="font-bold">Numéro de commande :</span> 
                                    {{ $commande->idcommande }}
                                </p>
                                <p>
                                    <span class="font-bold">Type Livraison:</span> 
                                    {{ $commande->typeLivraison()->first()->nomlivraison }}
                                </p><br>

                                @if ($commande->expeditioncmd)
                                <span class="whitespace-nowrap rounded-full bg-green-100 px-2.5 py-0.5 text-sm text-green-700">
                                    Expediée
                                </span>
                                @else
                                    <span class="whitespace-nowrap rounded-full bg-yellow-100 px-2.5 py-0.5 text-sm text-yellow-700">
                                        En préparation
                                    </span>
                                @endif
                            </div>
                            <div class="flex flex-1 items-center justify-end gap-2">
                                <div class="w-1/2 border border-gray-300 rounded-md p-4">
                                    <p><span class="font-bold">Adresse : </span></p>
                                    <div class="text-xs">
                                        <p><span class="font-bold">Ville :</span> {{ $commande->villelivraisoncmd }}</p>
                                        <p><span class="font-bold">Rue :</span> {{ $commande->ruelivraisoncmd }}</p>
                                        <p><span class="font-bold">Code Postal :</span> {{ $commande->postallivraisoncmd }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    <script>
      
    </script>
@endsection
