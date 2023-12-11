@extends('layouts.app')

@section('title', 'Theme de Vote')

@section('content')

<div class="p-8 bg-gradient-to-br from-black to-gray-600">
    <p class="text-3xl font-bold uppercase text-white">Theme de Vote</p>

    @if(session('msg'))
        <p class="text-red-500 text-white">{{ session('msg') }}</p>
    @endif
    </div>

<ul class="p-8 mx-20 grid grid-cols-4 gap-4 ">
    @foreach($themevotes as $themevote)
        <a href={{ route('selectedtheme', ['id' => $themevote->idthemevote]) }}><li class="h-96 flex items-center text-xl justify-center font-bold border-2 border-black p-8 rounded-md bg-gradient-to-br from-gray-900 to-gray-800 text-white">{{$themevote->titrethemevote}}
        @foreach($alreayvote as $vote)

            @if($vote[0] == $themevote->idthemevote && $vote[1])
                <span class="text-red-500 text-left">Déjà voté</span>
            @endif

        @endforeach
        </li></a>
    @endforeach
</ul>


@endsection
