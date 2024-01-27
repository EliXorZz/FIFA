@extends('layouts.base')

@section('title', 'Service vente')

@section('body')

<div class="flex">
    <div class="flex h-screen flex-col justify-between border-e w-64">
        <div class="px-4 py-6">
            <div class="flex justify-center">
                <img src="{{ asset('assets/logo-black.svg') }}" />
            </div>

            <ul class="mt-6 space-y-1">
                @php
                    $list = [
                        [ 'name' => 'Liste des produits', 'route' => 'service-vente.produits.index' ],
                        [ 'name' => 'Liste des categories', 'route' => 'service-vente.categories.index' ]
                    ]
                @endphp

                @foreach ($list as $item)
                    @if (Route::current()->getName() == $item['route'])
                        <a class="block rounded-lg px-4 py-2 text-sm font-medium bg-gray-100 text-gray-700">
                            {{ $item['name'] }}
                        </a>
                    @else
                        <a href="{{ route($item['route']) }}" class="block rounded-lg px-4 py-2 text-sm font-medium text-gray-500 hover:bg-gray-100 hover:text-gray-700">
                            {{ $item['name'] }}
                        </a>
                    @endif
                @endforeach
            </ul>
        </div>

        <div class="sticky inset-x-0 bottom-0 border-t border-gray-100">
          <a href="#" class="flex items-center gap-2 bg-white p-4 hover:bg-gray-50">
            <div>
              <p class="text-xs">
                <strong class="block font-medium">
                    {{ auth()->user()->surnomutilisateur }}
                </strong>

                <span>
                    {{ auth()->user()->mailutilisateur }}
                </span>
              </p>
            </div>
          </a>
        </div>
    </div>

    <div class="w-full">
        @if(session()->has('notification'))
            <div class="bg-green-600 px-4 py-3 text-white">
                <p class="text-center text-sm font-medium">
                    {{ session()->get('notification') }}
                </p>
            </div>
        @endif

        @error('message')
            <div class="bg-red-600 px-4 py-3 text-white">
                <p class="text-center text-sm font-medium">
                    {{ $message }}
                </p>
            </div>
        @enderror

        <div class="p-10 flex flex-col gap-7">
            <h1 class="text-xl font-bold">
                @yield('title')
            </h1>

            @yield('content')
        </div>
    </div>
</div>

@endsection
