@props([
    'class'=> uniqid(),
    'containerClass'=> '',
    'containerInlineClass'=> '',
    'splideTrackClass'=> '',
    'perPage' => 1,            // main slider perPage
    'perPageMobile' => 1,
    'perPageTablet' => 1,
    'thumbPerPage' => 4,       // thumbnails per page (desktop)
    'thumbPerPageMobile' => 2,
    'thumbPerPageTablet' => 3,
    'showArrows' => true,
    'pagination' => false,
    'autoplay' => false,
    'pauseOnHover' => false,
    'type' => 'loop',
    'gap' =>'1rem',
    'id' =>'id',
])

{{-- MAIN SLIDER --}}
<div
    id="{{ $id }}"
    class="splide selector-{{ $class }} w-full {{ $containerClass }}"
    data-type="{{ $type }}"
    data-per-page="{{ $perPage }}"
    data-per-page-mobile="{{ $perPageMobile }}"
    data-per-page-tablet="{{ $perPageTablet }}"
    data-show-arrows="{{ $showArrows ? 'true' : 'false' }}"
    data-pagination="{{ $pagination ? 'true' : 'false' }}"
    data-gap="{{ $gap }}"
    data-autoplay="{{ $autoplay ? 'true' : 'false' }}"
    data-pause-on-hover="{{ $pauseOnHover ? 'true' : 'false' }}"
    style="padding-bottom: 20px; {{ $containerInlineClass }}"
>
    <div class="splide__track" style="{{ $splideTrackClass }}">
        <ul class="splide__list">
            {!! trim($slot) !!}
        </ul>
    </div>
</div>

{{-- THUMBNAILS --}}
@if(isset($thumbnail))
    <div
        id="thumbnails_{{ $id }}"
        class="splide thumbnails-root selector-{{ $class }}-thumbs w-full {{ $containerClass }}"
        data-thumb-per-page="{{ $thumbPerPage }}"
        data-thumb-per-page-mobile="{{ $thumbPerPageMobile }}"
        data-thumb-per-page-tablet="{{ $thumbPerPageTablet }}"
        style="padding-top: 12px; width: 80%; margin: 0 auto;"
    >
        <div class="splide__track">
            <ul class="splide__list">
                {!! trim($thumbnail) !!}
            </ul>
        </div>
    </div>
@endif

@push('js')
    <script>
        (() => {
            if (!window.initSplideOnce) {
                window.initSplideOnce = true;

                const parseBool = (v) => (v === 'true' || v === true);

                const ensureListStructure = (root) => {
                    let track = root.querySelector('.splide__track');
                    if (!track) {
                        track = document.createElement('div');
                        track.className = 'splide__track';
                        while (root.firstChild) track.appendChild(root.firstChild);
                        root.appendChild(track);
                    }
                    let list = track.querySelector('.splide__list');
                    if (!list) {
                        list = document.createElement('ul');
                        list.className = 'splide__list';
                        while (track.firstChild) list.appendChild(track.firstChild);
                        track.appendChild(list);
                    }
                    Array.from(list.children).forEach(child => {
                        if (child.tagName.toLowerCase() !== 'li' || !child.classList.contains('splide__slide')) {
                            const li = document.createElement('li');
                            li.className = 'splide__slide';
                            list.replaceChild(li, child);
                            li.appendChild(child);
                        } else {
                            child.classList.add('splide__slide');
                        }
                    });
                    return { track, list };
                };

                window.reInitSplides = function(context = document) {
                    context.querySelectorAll('.splide').forEach(root => {
                        if (root.dataset.splideInitialized === 'true') return;

                        const { list } = ensureListStructure(root);
                        if (!list) return;

                        let optsFromData = {};
                        try {
                            if (root.dataset.splideOptions) optsFromData = JSON.parse(root.dataset.splideOptions);
                        } catch(e) {
                            console.error('Invalid JSON in data-splide-options', e);
                        }

                        const defaultOptions = {
                            type: root.dataset.type || 'loop',
                            perPage: parseInt(root.dataset.perPage) || 1,
                            gap: root.dataset.gap || '1rem',
                            autoplay: parseBool(root.dataset.autoplay),
                            pauseOnHover: parseBool(root.dataset.pauseOnHover),
                            pagination: parseBool(root.dataset.pagination),
                            arrows: parseBool(root.dataset.showArrows),
                            autoHeight: true,
                            classes: {
                                prev: 'splide__arrow--prev splide-custom-class-prev',
                                next: 'splide__arrow--next splide-custom-class-next'
                            },
                            breakpoints: {
                                1024: { perPage: parseInt(root.dataset.perPageTablet) || 1 },
                                640: { perPage: parseInt(root.dataset.perPageMobile) || 1 }
                            }
                        };

                        let isThumbs = root.id && root.id.startsWith('thumbnails_') || root.classList.contains('thumbnails-root');

                        if (!isThumbs) {
                            // Main slider
                            const thumbRoot = document.getElementById(`thumbnails_${root.id}`);
                            let thumbSplide = null;

                            if (thumbRoot) {
                                ensureListStructure(thumbRoot);

                                const thumbOpts = {
                                    type: 'slide',
                                    isNavigation: true,
                                    focus: 'center',
                                    pagination: false,
                                    drag: true,
                                    autoHeight: false,
                                    rewind: true,
                                    arrows: true,
                                    breakpoints: {
                                        1024: { perPage: parseInt(thumbRoot.dataset.thumbPerPageTablet) || 3 },
                                        640: { perPage: parseInt(thumbRoot.dataset.thumbPerPageMobile) || 2 }
                                    },
                                    classes: {
                                        prev: 'splide__arrow--prev splide-custom-class-thumb-prev',
                                        next: 'splide__arrow--next splide-custom-class-thumb-next'
                                    }
                                };

                                // Hide arrows if slides <= perPage
                                const slidesCount = thumbRoot.querySelectorAll('.splide__slide').length;
                                if (slidesCount <= parseInt(thumbRoot.dataset.thumbPerPage)) {
                                    thumbOpts.arrows = false;
                                }

                                thumbSplide = new Splide(thumbRoot, thumbOpts);

                                // Hide arrows dynamically on resize / updated
                                thumbSplide.on('updated', () => {
                                    const slides = thumbRoot.querySelectorAll('.splide__slide').length;
                                    const currentPerPage = thumbSplide.options.perPage;
                                    thumbRoot.querySelectorAll('.splide__arrow').forEach(a => {
                                        a.style.display = (slides <= currentPerPage) ? 'none' : '';
                                    });
                                });

                                thumbRoot.dataset.splideInitialized = 'true';
                            }

                            // Main slider init
                            const mainSplide = new Splide(root, { ...defaultOptions, ...optsFromData });
                            mainSplide.on('mounted', () => {
                                root.querySelectorAll('.splide-custom-class-prev').forEach(el => {
                                    el.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256">
                                <rect width="256" height="256" fill="none"/>
                                <polyline points="96 48 176 128 96 208" fill="none"
                                    stroke="currentColor" stroke-linecap="round"
                                    stroke-linejoin="round" stroke-width="16"/>
                            </svg>`;
                                });
                                root.querySelectorAll('.splide-custom-class-next').forEach(el => {
                                    el.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20"><path d="M9 5l7 7-7 7" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"/></svg>`;
                                });
                            });

                            if (thumbSplide) mainSplide.sync(thumbSplide);

                            mainSplide.mount();
                            if (thumbSplide) thumbSplide.mount();

                            root.dataset.splideInitialized = 'true';
                            window.splideInstances = window.splideInstances || {};
                            window.splideInstances[root.id] = { main: mainSplide, thumbs: thumbSplide };

                        } else {
                            root.dataset.splideInitialized = 'true';
                        }
                    });
                };

                document.addEventListener('DOMContentLoaded', () => window.reInitSplides());

                const observer = new MutationObserver(mutations => {
                    for (const m of mutations) {
                        m.addedNodes.forEach(node => {
                            if (node.nodeType === 1 && node.querySelector && node.querySelector('.splide')) {
                                window.reInitSplides(node);
                            }
                        });
                    }
                });
                observer.observe(document.body, { childList: true, subtree: true });
            }
        })();
    </script>
@endpush

@push('css')
    <style>
        .selector-{{ $class }}-thumbs .splide__slide {
            cursor: pointer;
            width: 70px !important;
            flex-shrink: 0;
        }
        .selector-{{ $class }}-thumbs .splide__slide img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            display: block;
            border-radius: 5px;
        }
        .selector-{{ $class }}-thumbs .splide__track--nav>.splide__list>.splide__slide {
            padding: 1px;
        }
        .selector-{{ $class }}-thumbs .splide__track--nav>.splide__list>.splide__slide.is-active {
            border: 2px solid var(--color-main);
            border-radius: 5px;
        }
        .splide-custom-class-thumb-prev{
            border-radius: 3px !important;
            height: 70px !important;
            left: 0 !important;
            top: 51px !important;
            box-shadow: none !important;
            border: 1px solid #fcecff !important;
        }
        .splide-custom-class-thumb-next, .splide-custom-class-thumb-prev{
            border-radius: 3px !important;
            height: 70px !important;
            right: 0 !important;
            top: 51px !important;
            box-shadow: none !important;
            border: 1px solid #fcecff !important;
        }
        .splide.is-focus-in .splide__arrow:focus {
            outline: none !important;
            outline-offset: 0 !important;
        }
        .selector-{{ $class }}:hover .splide__arrow { opacity: 1; }

    </style>
@endpush
