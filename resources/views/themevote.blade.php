@extends('layouts.app')

@section('title', 'Theme de Vote')

@section('content')

<div class="p-8">
    <p class="text-3xl font-bold uppercase">Theme de Vote</p>

    @if(session('msg'))
        <p class="text-red-500">{{ session('msg') }}</p>
    @endif
</div>



<ul class="mx-20">
    @foreach($themevotes as $themevote)
        <a href={{ route('selectedtheme', ['id' => $themevote->idthemevote]) }}><li class="border-2 border-black p-8">{{$themevote->titrethemevote}}</li></a>
    @endforeach
</ul>


@endsection
