<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="shortcut icon" href="{{ asset('favicon.ico') }}">

    <title>@yield('title')</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fork-corner/dist/fork-corner.min.css">
    <script src="https://cdn.jsdelivr.net/npm/fork-corner/dist/fork-corner.min.js" defer></script>
</head>

<body class="@yield('bodyClass')">
    <a href="https://github.com/elixorzz/fifa" target="_blank" id="fork-corner" class="fork-corner fc-pos-bl fc-size-medium fc-animate fc-theme-github"></a>
    @yield('body')

    <script>
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
</body>

<script>
    //TABLE HREF
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

</html>
