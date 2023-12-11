<div class="flex flex-col gap-8">
    <h1 class="text-xl font-bold">{{$titre}} ({{count($publications)}})</h1>

    @foreach($publications as $publication)
        @php
            $nameurl = 'show'.$titre;
            $parametre = Str::lower($titre);
        @endphp
        <a href=" {{route($nameurl, [ $parametre => $publication->idpublication ] )}} " class="hover:bg-gray-200">
            <div class="border border-black flex gap-5 items-center p-5">
                @if ($publication->photo)
                    <img src="{{ $publication->photo->urlphoto }}" width="130" >
                @endif
                <div>
                    <h2 class="font-bold">{{ $publication->titrepublication }}</h2>
                    <p class="text-xs">{{$publication->resumepublication}}</p>
                </div>
            </div>
        </a>
    @endforeach
</div>
