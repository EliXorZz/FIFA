@extends('layouts.app')

@section('title', 'Vote')

@section('content')

<style>
input[type="checkbox"] {
      display: none;
    }

    label.checkbox-label {
      display: inline-block;
      width: 30px;
      height: 30px;
      background-color: black;
      color: white;
      text-align: center;
      line-height: 30px;
      cursor: pointer;
      border: 2px solid black;
      user-select: none;
    }

    input[type="checkbox"]:disabled + label.checkbox-label {
      opacity: 0.2;
      cursor: not-allowed;
    }

    input[type="checkbox"]:checked + label.checkbox-label {
      background-color: white;
      color: black;
    }

    input[type="checkbox"]:disabled:checked + label.checkbox-label
    {
        opacity: 1;
    }
</style>

<div class="p-2  bg-gradient-to-br from-gray-900 to-gray-800 text-white">

    <form action=" {{ route('doVote') }} " method="post">
    @csrf

        <input type="hidden" name="idthemevote" value="{{$titre->idthemevote}}">

        <p class="p-8 bg-black text-3xl font-bold uppercase text-white bg-black rounded flex items-center justify-center">{{ $titre->titrethemevote }}</p>
        @if(count($voter) != 0)
            <span class="text-red-500 text-left">Déjà voté</span>
        @endif
        @foreach ($errors->all() as $error)
            <p class="text-sm text-red-400">{{$error}}</p>
        @endforeach

        <div class="grid gap-8 grid-cols-5 m-8">

            @foreach($joueurs as $joueur)
                <a href=" {{ route('showPublication', ['joueur' => $joueur->idjoueur]) }} ">
                <table class="border-2 text-center table-fixed bg-gradient-to-br from-gray-400 to-gray-800 text-white">
                    <tr class="justify-center" >
                        <td colspan="2" class="pb-2 p-5">
                            <div class="bg-black h-60 w-full ">
                                <img class="object-center object-cover w-full h-full" src=" {{ $joueur->photojoueur }} "/>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td class="w-1/2 text-xl">
                            {{$joueur->nomjoueur}}

                            {{$joueur->prenomjoueur}}
                        </td></a>
                    </tr>
                    <tr>
                        <td colspan="3" class="pb-5">

                            <input type="checkbox" class="" name="check_1" value="{{$joueur->idjoueur}}" id="ck1_{{$joueur->idjoueur}}" @foreach($voter as $vote) @if($vote[0] == $joueur->idjoueur && $vote[1] == 1) checked @endif @disabled(true) @endforeach>
                            <label class="checkbox-label" for="ck1_{{$joueur->idjoueur}}">1</label>

                            <input type="checkbox" class="" name="check_2" value="{{$joueur->idjoueur}}" id="ck2_{{$joueur->idjoueur}}" @foreach($voter as $vote) @if($vote[0] == $joueur->idjoueur && $vote[1] == 2) checked @endif @disabled(true) @endforeach>
                            <label class="checkbox-label" for="ck2_{{$joueur->idjoueur}}">2</label>

                            <input type="checkbox" class="" name="check_3" value="{{$joueur->idjoueur}}" id="ck3_{{$joueur->idjoueur}}" @foreach($voter as $vote) @if($vote[0] == $joueur->idjoueur && $vote[1] == 3) checked @endif @disabled(true) @endforeach>
                            <label class="checkbox-label" for="ck3_{{$joueur->idjoueur}}">3</label>

                        </td>
                    </tr>
                </table>
            @endforeach
        </div>

        @if(count($voter) == 0)
        <input type="submit" class="mt-6 bg-black text-white font-bold px-10 py-2 uppercase cursor-pointer" value="Valider mes votes">
        @endif
    </form>

</div>

    <script>
        let checkboxall = document.querySelectorAll('input[type="checkbox"]');

        let selectedGroup = [];
        let selectedCheck = [];

        checkboxall.forEach(check => {
            check.addEventListener("change", _ => {



                if(check.checked)
                {
                    selectedGroup.push(check.value);
                    selectedCheck.push(check.name)

                    checkboxall.forEach(element => {

                        if(selectedCheck.includes(element.name) || selectedGroup.includes(element.value))
                        {
                            if (!element.checked)
                            {
                                element.disabled = true
                            }


                        }

                        check.disabled = false

                    });
                }
                else
                {
                    let index = selectedCheck.indexOf(check.name);

                    if (index !== -1)
                    {
                        selectedCheck.splice(index, 1);
                    }

                    index = selectedGroup.indexOf(check.value);

                    if (index !== -1)
                    {
                        selectedGroup.splice(index, 1);
                    }

                    checkboxall.forEach(element => {

                        if(!selectedCheck.includes(element.name) && !selectedGroup.includes(element.value))
                        {

                            element.disabled = false;

                        }

                    });
                }
            })
        });







    </script>


@endsection
