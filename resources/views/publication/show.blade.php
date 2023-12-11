@extends('layouts.app')

@section('title', 'Publication')

@section('content')

<div class="p-10">
    <div class="flex flex-col border-2 border-black p-5 px-32">
        <div class="flex flex-row align-middle items-center gap-3 mb-5">
            @empty($photos)
                <img class="w-1/2" src={{$photo->first()->urlphoto}}>
            @endempty
            <h1 class="font-bold underline w-1/2 text-3xl text-center">
                {{ $publication->titrepublication }}
            </h1>
        </div>
        <div class="text-justify ">
            {{ $publication->textearticle}}
            {{ $publication->texteblog}}
        </div>
        @isset($photos)
            @include('publication.shared.carousselle', [ 'class' => ['m-20'], 'photos' => $photos ])
        @endisset

    </div>
<div>



@endsection
