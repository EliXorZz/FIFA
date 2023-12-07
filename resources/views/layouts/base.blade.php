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
