<h1>Vérifier votre adresse mail !</h1>

<form action="{{ route('verification.send') }}" method="POST">
@csrf
    <input type="submit" value="Renvoyer le mail de vérification">
    @if (session('message'))
        <p>{{ $message }}</p>
    @endif
</form>
