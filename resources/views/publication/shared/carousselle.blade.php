@foreach ($photos as $unephoto)
    <input id="lesimg" value="{{$unephoto->urlphoto}}" hidden>
@endforeach

<div @class($class)>
    <div class="__carouselle flex flex-col relative justify-center items-center w-full">
        <div class="__slider p-0 m-0 box-border flex justify-start overflow-x-hidden  snap-mandatory snap-x scroll-smooth shadow-md">

        </div>
        <div class="__sliderindicateur m-0 box-border flex justify-center p-5">

        </div>
        <img src="/assets/chevron-left.svg" class="w-20 p-0 m-0 box-border absolute top-1/2 text-6xl cursor-pointer -translate-y-1/2 transition ease-in delay-200 right-full" id='precedant-bt'>
        <img src="/assets/chevron-right.svg" class="w-20 p-0 m-0 box-border absolute top-1/2 text-6xl cursor-pointer -translate-y-1/2 transition ease-in delay-200 left-full" id='suivant-bt'>

        <span name='cssincluder' class="m-20 w-full snap-start p-0 box-border w-4 h-4 rounded-full bg-gray-500 m-1 cursor-pointer hover:bg-gray-700 active:bg-gray-800" hidden>

    </div>
</div>

<script defer>
    //Img
    const listImage = [];
    document.querySelectorAll('#lesimg').forEach(element => {
        listImage.push(element.value)
    });

    // Element HTML
    const slider = document.querySelector('.__slider')
    const indicateurs = document.querySelector('.__sliderindicateur')
    const precedant_bt = document.getElementById('precedant-bt')
    const suivant_bt = document.getElementById('suivant-bt')

    listImage.map((imageSrc, index) => {

        const imageElement = document.createElement('img');

        imageElement.src = imageSrc;
        imageElement.id = index;
        imageElement.classList.add("__slide","w-full","snap-start");
        slider.appendChild(imageElement);

        const indicateurElement = document.createElement("a");
        indicateurElement.href = `#${index}`;
        indicateurElement.classList.add("__indicateur","p-0","box-border","w-4","h-4","rounded-full","bg-gray-500","m-1","cursor-pointer","hover:bg-gray-700","active:bg-gray-800");
        indicateurs.appendChild(indicateurElement);


    })
    const imageWidth = document.querySelector('.__carouselle').offsetWidth;

    slider.scrollBy(0, 0);

    let currentIndex = 0;
    document.querySelector(`a[href='#${currentIndex}']`).classList.add('active');

    let currentScrollLevel = slider.scrollLeft;



    slider.addEventListener('scroll', () => {
        currentScrollLevel = slider.scrollLeft;

        currentIndex = Math.floor(currentScrollLevel / imageWidth);

        const allIndicateurs = [...document.getElementsByClassName('__indicateur')];

        allIndicateurs.map(indicateur => indicateur.classList.remove('active','bg-gray-800'));
        allIndicateurs.map(indicateur => indicateur.classList.add('bg-gray-500'));


        document.querySelector(`a[href='#${currentIndex}']`).classList.add('active','bg-gray-800');
    })


    precedant_bt.addEventListener('click', () => {
        slider.scrollBy(-imageWidth, 0);
    })

    suivant_bt.addEventListener('click', () => {
        slider.scrollBy(imageWidth, 0);
    })


</script>
