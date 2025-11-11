@props([
    'images' => [],
    'options' => [],
    'id' => 'gallery_'.uniqid(),
    'isThumbnail' => false
])

@php
if(isset($options['condition'])){
    $conditionColor  ='';
    $conditionText  ='';
    if($options['condition'] === 'new'){
        $conditionColor = 'bg-green-500 border-green-600';
        $conditionText = 'ახალი';
    }elseif ($options['condition'] === 'owned'){
        $conditionColor = 'bg-blue-500 border-blue-600';
        $conditionText = 'მეორადი';
    }
}
@endphp
<div id="{{ $id }}"
     class="relative overflow-hidden mx-auto {{ $options['wrapperClasses'] ?? '' }}"
     style="max-width: {{ $options['width'] ?? '800px' }}; height: {{ $options['height'] ?? '500px' }};">
    <div class="absolute top-2 right-1 z-1">
        <span class="border rounded-[10px] text-xs text-white px-[5px] py-[3px] italic shadow-lg {{ $conditionColor }}">{{ $conditionText }}</span>
    </div>
    <x-carousel :arrows :onHoverArrows="false" :pagination="false" perPage="1" perPageMobile="1" perPageTablet="1">

        @foreach($images as $img)
            <a href="{{ $img['src'] ?? '' }}"
               data-sub-html="{{ $img['caption'] ?? '' }}"
               class="overflow-hidden rounded-lg flex items-center justify-center w-full h-full">
                <img src="{{ $img['thumb'] ?? $img['src'] }}"
                     alt="{{ $img['caption'] ?? 'image' }}"
                     class="max-w-full max-h-full object-contain transition-transform duration-300 hover:scale-105" />
            </a>
        @endforeach

        @if($isThumbnail)
            <x-slot:thumbnail>
                @foreach($images as $img)
                    <img src="{{ $img['thumb'] ?? $img['src'] }}" class="w-[70px] h-[70px] object-cover" />
                @endforeach
            </x-slot:thumbnail>
        @endif
    </x-carousel>
</div>

@once
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            document.querySelectorAll('[id^="gallery_"]').forEach(gallery => {
                lightGallery(gallery, {
                    plugins: [
                        {{ ($options['zoom'] ?? false) ? 'lgZoom,' : '' }}
                            {{ ($options['thumbnail'] ?? true) ? 'lgThumbnail,' : '' }}
                            {{ ($options['fullscreen'] ?? false) ? 'lgFullscreen,' : '' }}
                    ].filter(Boolean),
                    speed: {{ $options['speed'] ?? 500 }},
                    mode: '{{ $options['mode'] ?? 'lg-slide' }}',
                    thumbnail: {{ ($options['thumbnail'] ?? true) ? 'true' : 'false' }},
                    zoom: {{ ($options['zoom'] ?? true) ? 'true' : 'false' }},
                    fullscreen: {{ ($options['fullscreen'] ?? true) ? 'true' : 'false' }},
                    thumbWidth: {{ $options['thumbWidth'] ?? 100 }},
                    thumbHeight: {{ $options['thumbHeight'] ?? 70 }},
                    animateThumb: {{ ($options['animateThumb'] ?? true) ? 'true' : 'false' }},
                    showThumbByDefault: {{ ($options['showThumbByDefault'] ?? true) ? 'true' : 'false' }},
                    toggleThumb: {{ ($options['toggleThumb'] ?? false) ? 'true' : 'false' }},
                    thumbMargin: {{ $options['thumbMargin'] ?? 5 }},
                    slideEndAnimation: true,
                    download: false,
                    controls: {{ ($options['controls'] ?? true) ? 'true' : 'false' }},
                    loop: {{ ($options['loop'] ?? true) ? 'true' : 'false' }},
                    selector: 'a',
                });
            });
        });
    </script>
@endonce
