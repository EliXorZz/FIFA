<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="shortcut icon" href="{{ asset('favicon.ico') }}">

    <title>@yield('title')</title>
</head>

<body class="@yield('bodyClass')">
    @yield('body')

    @if(session()->has('notification'))

        <div id="notification" class="absolute top-0 right-0 rounded-xl border border-gray-100 bg-white p-4 w-80 mt-20">
            <div class="flex items-start gap-4">
                <span class="text-green-600">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="h-6 w-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                </span>

                <div class="flex-1">
                    <strong class="block font-medium text-gray-900">{{ session()->get('notification')['title'] }}</strong>

                    <p class="mt-1 text-sm text-gray-700">
                        {{ session()->get('notification')['description'] }}
                    </p>
                </div>
            </div>
        </div>

        <script>
            setTimeout(function(){
                const notification = document.getElementById('notification');
                notification.remove()
            }, 3600);
        </script>
    @endif

</body>

</html>
