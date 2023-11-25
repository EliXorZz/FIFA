<h1>Vérifier votre adresse mail !</h1>

<form action="{{ route('doResendVerifyAccount') }}" method="POST">
@csrf
    <input type="submit" value="Renvoyer le mail de vérification">
    @if (session('message'))
        <p>{{ session('message') }}</p>
    @endif
</form>
