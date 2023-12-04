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
</style>

<div class="p-8">

    <form action=" {{ route('doVote') }} " method="post">
    @csrf

        <input type="number" name="idthemevote" value="{{$titre->idthemevote}}" hidden>

        <p class="text-3xl font-bold uppercase">{{ $titre->titrethemevote }}</p>


        @foreach ($errors->all() as $error)
            <p class="text-sm text-red-400">{{$error}}</p>
        @endforeach

        <div class="grid gap-8 grid-cols-5 m-8">

            @foreach($joueurs as $joueur)
                <table class="border-2 text-center table-fixed">
                    <tr class="justify-center" >
                        <td colspan="2" class="pb-2 p-5">
                            <img src=" {{ $joueur->photojoueur }} "/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w-1/2">
                            {{$joueur->nomjoueur}}

                            {{$joueur->prenomjoueur}}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="pb-5">
                            <input type="checkbox" class="" name="check_1" value="{{$joueur->idjoueur}}" id="ck1_{{$joueur->idjoueur}}">
                            <label class="checkbox-label" for="ck1_{{$joueur->idjoueur}}">1</label>

                            <input type="checkbox" class="" name="check_2" value="{{$joueur->idjoueur}}" id="ck2_{{$joueur->idjoueur}}">
                            <label class="checkbox-label" for="ck2_{{$joueur->idjoueur}}">2</label>

                            <input type="checkbox" class="" name="check_3" value="{{$joueur->idjoueur}}" id="ck3_{{$joueur->idjoueur}}">
                            <label class="checkbox-label" for="ck3_{{$joueur->idjoueur}}">3</label>
                        </td>
                    </tr>
                </table>
            @endforeach
        </div>


        <input type="submit" class="mt-6 bg-black text-white font-bold px-10 py-2 uppercase cursor-pointer" value="Valider mes votes">
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
