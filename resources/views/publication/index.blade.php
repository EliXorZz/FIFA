@extends('layouts.app')

@section('title', 'Publication')

@section('content')

<div class="flex flex-col gap-10 p-10">
    @include('publication.shared.information', ['titre' => 'Article', 'publications' => $article])
    @include('publication.shared.information', ['titre' => 'Album', 'publications' => $album])
    @include('publication.shared.information', ['titre' => 'Blog', 'publications' => $blog])
    @include('publication.shared.information', ['titre' => 'Document', 'publications' => $document])
</div>

@endsection
