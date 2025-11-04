@extends('layouts.app')
@section('content')

    <div class="container mx-auto font-custom-regular my-[30px]">

        <div class="flex flex-col md:flex-row w-full gap-[30px]">

            {{-- Left menu --}}
            <div class="w-[400px]">
                <div class="bg-white rounded-2xl shadow-md py-4">
                    <ul class="divide-y divide-slate-200 [--tw-divide-opacity:1] [--tw-divide-width:90%]">
                        @for($i = 0; $i <= 5; $i++)
                            <li class=" hover:bg-[var(--color-main-hover)] hover:text-white   transition-colors duration-200 flex group mx-[12px] hover:rounded-[10px]">
                                <a href="" class="flex-1 p-3 pl-1 flex items-center gap-1.5">
                                        <span class="group-hover:text-white">
                                            <x-dynamic-component :component="'phosphor-device-mobile'" class="h-[23px] w-[23px] !text-black/80 group-hover:!text-white"/>
                                        </span>
                                    <span class="text-[14px] text-black/80 group-hover:text-white transition-colors duration-200">მობილურები</span>
                                </a>
                            </li>
                        @endfor
                    </ul>
                </div>
            </div>

            {{-- Right slider --}}
            <div class="flex-1 bg-white rounded-2xl self-start min-h-[380px]">
                @php
                    $bannerOptions = [
                        ['img' => asset('assets/images/temp/banner.jpg'), 'url' => 'https://google.ge'],
                    ];
                    $bannerOptions2 = [
                        ['img' => asset('assets/images/temp/banner2.webp'), 'url' => 'https://google.ge'],
                    ];
                @endphp

                <x-carousel
                    perPage="1"
                    :pagination="false"
                    containerInlineClass="padding-bottom:0;"
                    splideTrackClass="padding-bottom:0;"
                >

                    <x-banners
                        wrapperClass="grid grid-cols-1 md:!grid-cols-{{ count($bannerOptions) }} gap-[12px]"
                        :options="$bannerOptions"
                        :hrefOptions="['target' => '_blank']"
                        :imageOptions="['rel' => 'image title']"
                        imageClass="w-full object-cover h-[380px] overflow-hidden rounded-2xl"

                    />

                    <x-banners
                        wrapperClass="grid grid-cols-1 md:!grid-cols-{{ count($bannerOptions2) }} gap-[12px]"
                        :options="$bannerOptions2"
                        :hrefOptions="['target' => '_blank']"
                        :imageOptions="['rel' => 'image title']"
                        imageClass="w-full object-cover h-[380px] overflow-hidden rounded-2xl"
                    />

                </x-carousel>
            </div>

        </div>

    </div>

@endsection
