@extends('layouts.base')

@section('title', 'Service d\'expédition')

@section('body')

<div class="flex">
    <div class="flex h-screen flex-col justify-between border-e w-64">
        <div class="px-4 py-6">
            <div class="flex justify-center">
                <img src="{{ asset('assets/logo-black.svg') }}" />
            </div>

            <ul class="mt-6 space-y-1">
                @foreach ($typeslivraison->get() as $livraison)
                    <li>
                        @if (isset($typelivraison) && $livraison == $typelivraison)
                            <a href="" class="block rounded-lg px-4 py-2 text-sm font-medium bg-gray-100 text-gray-700">
                                Livraison {{ $livraison->nomlivraison }}
                            </a>
                        @else
                            <a href="{{ route('service-expedition', [ 'typelivraison' => $livraison ]) }}" class="block rounded-lg px-4 py-2 text-sm font-medium text-gray-500 hover:bg-gray-100 hover:text-gray-700">
                                Livraison {{ $livraison->nomlivraison }}
                            </a>
                        @endif
                    </li>
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

<script>
    const smsPopups = document.querySelectorAll('div[data-sms-popup]')
    smsPopups.forEach(smsPopup => {
        smsPopup.addEventListener('click', (event) => {
            const target = event.target

            if (target.dataset.cancel != null)
                smsPopup.classList.add('hidden')
        })
    })

    const smsButtons = document.querySelectorAll('button[data-sms]')
    smsButtons.forEach(smsButton => {
        smsButton.addEventListener('click', (event) => {
            const commande = smsButton.dataset.sms

            const popup = document.querySelector(`div[data-sms-popup='${commande}']`)

            popup.classList.remove('hidden')
        })
    })

    const rows = document.querySelectorAll('tr[data-href]')
    rows.forEach(row => {
        row.addEventListener('click', (event) => {
            const target = event.target

            if (target.tagName == 'BUTTON')
                return

            window.location.href = row.dataset.href
        })
    })
</script>

@endsection
