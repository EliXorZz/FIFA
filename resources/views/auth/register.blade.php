<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mon compte</title>
</head>
<body>
    <h1>Créer mon compte</h1>
        <form method="post" action="{{ route('register') }}">
            @csrf
            @foreach ($errors->all() as $error)
                {{ $error }}<br>
            @endforeach

            <label for="prenomutilisateur">Prenom : </label><input type="text" maxlength="100" required minlength="1" name="prenomutilisateur" value="{{ old('prenomutilisateur') }}">

            <label for="surnomutilisateur">Pseudonyme : </label><input type="text" maxlength="100" required minlength="1" name="surnomutilisateur" value="{{ old('surnomutilisateur') }}">

            <label for="mailutilisateur">Email : </label><input type="email" maxlength="100" name="mailutilisateur" placeholder="exemple@exemple.com" value="{{ old('mailutilisateur') }}">

            <label for="datenaissance">Date de naissance : </label><input type="date" name="datenaissance" value="{{ old('datenaissance') }}">

            <label for="idlangue">Langue : </label>

            <select name="idlangue">

                <option value=""></option>

                @foreach ($langues as $langue)
                    <option value="{{$langue->idlangue}}" {{old('idlangue') == $langue->idlangue ? 'selected' : ''}}>{{ $langue->nomlangue }}</option>
                @endforeach

            </select>

            <label for="idpays">Pays : </label>

            <select name="idpays">

                <option value=""></option>

                @foreach ($pays as $item)
                    <option value="{{$item->idpays}}" {{old('idpays') == $item->idpays ? 'selected' : ''}}>{{ $item->nompays }}</option>
                @endforeach

            </select>

            <label for="idpaysfavori">Pays favori : </label>

            <select name="idpaysfavori">

                <option value=""></option>

                @foreach ($pays as $item)
                    <option value="{{$item->idpays}}" {{old('idpaysfavori') == $item->idpays ? 'selected' : ''}}>{{ $item->nompays }}</option>
                @endforeach

            </select>

            <label for="motpasse">Mot de passe : </label><input type="password" maxlength="200" name="motpasse">

            <label for="motpasse_confirmation">Confirmer le mot de passe : </label><input type="password" maxlength="200" name="motpasse_confirmation">

            <input type="submit" value="Créer">

        </form>
</body>
</html>
