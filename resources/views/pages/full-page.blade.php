@extends('layouts.app')
@section('content')
    @php
        $optionsFilter = [
           '1' => 'ფილტრი',
           '2' => 'ფილტრი',
           '3' => 'ფილტრი',
           ];

    $brands = ['Apple', 'Samsung', 'Xiaomi', 'Huawei', 'Oppo', 'Vivo', 'Nokia', 'Realme', 'OnePlus', 'Sony', 'Asus', 'Google', 'Honor'];
    shuffle($brands);
    @endphp
    <div class="container mx-auto font-custom-regular">

        <x-page-component  position="right" class="my-[20px]"  sidebar-class="bg-[var(--color-footer)] rounded-md w-[400px]">
            <x-slot:content>

                @php
                    $galleries = [
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img2.webp'), 'src' =>  asset('assets/images/temp/img2.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img3.webp'), 'src' =>  asset('assets/images/temp/img3.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                             ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img2.webp'), 'src' =>  asset('assets/images/temp/img2.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                             ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img2.webp'), 'src' =>  asset('assets/images/temp/img2.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                             ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img2.webp'), 'src' =>  asset('assets/images/temp/img2.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'Dark Souls 1'],
                        ]
                @endphp


                <div class="grid grid-cols-12 md:grid-cols-12 gap-2">
                    <div class="col-span-12 md:col-span-8">
                        <x-breadcrumbs />
                        <x-gallery
                            :isThumbnail="true"
                            :images="$galleries"
                            :options="[
                                    'cols' => 1,
                                    'gap' => 'gap-4',
                                    'mode' => 'lg-slide',
                                    'speed' => 600,
                                    'zoom' => true,
                                    'thumbnail' => true,
                                    'fullscreen' => true,
                                    'width' => '',
                                    'height' => '',
                                    'wrapperClasses' => 'w-[100%]',
                                    'zoom' => true,
                                    'controls' => true,
                                    'showThumbByDefault' => true,
                                    'thumbWidth' => 120,
                                    'thumbHeight' => 80,
                                    'thumbMargin' => 10,
                                ]"
                        />
                    </div>
                    <div class="col-span-12 md:col-span-4 bg-blue-300">
                        anotation right
                    </div>
                </div>


                <div class="grid grid-cols-1  bg-red-400 my-[20px]">
                    anotation below
                </div>


            </x-slot:content>
            <x-slot:sidebar>

                <div class="p-[16px]">


                    sidebar right


                </div>


            </x-slot:sidebar>

        </x-page-component>
    </div>
@endsection


@push('js')



@endpush
