@extends('layouts.app')
@section('content')

    <div class="container mx-auto font-custom-regular my-[30px]">

        <div class="flex flex-col md:flex-row w-full gap-[30px]">

            {{-- Left menu --}}
             @include('includes.home-left-menu')



            {{-- Right slider --}}
            @if($carousels)
             <div class="flex-1 bg-white rounded-2xl self-start min-h-[380px]">
                @php
                    $bannerOptions = [];
                    foreach ($carousels as $k => $carousel){
                        $bannerOptions[$k]['img'] = Voyager::image($carousel->images);
                        $bannerOptions[$k]['url'] = $carousel->link;
                    }
                @endphp
                <x-carousel
                    perPage="1"
                    :pause-on-hover="true"
                    :on-hover-arrows="false"
                    :autoplay="true"
                    :pagination="false"
                    containerInlineClass="padding-bottom:0;"
                    splideTrackClass="padding-bottom:0;"
                >
                    @foreach($bannerOptions as $k => $banner)
                        @php
                            $option = [$banner];

                        @endphp
                        <x-banners
                            wrapperClass="grid grid-cols-1 md:!grid-cols-1 }} gap-[12px]"
                            :options="$option"
                            :hrefOptions="['target' => '_blank']"
                            :imageOptions="['rel' => 'image title']"
                            imageClass="w-full object-cover h-[380px] overflow-hidden rounded-2xl"
                        />
                    @endforeach
                </x-carousel>
            </div>
            @endif
        </div>


        <div class="my-[50px]">

            {{--product blocks start--}}
            @include('includes.product-blocks')
            {{--product blocks end--}}


            {{--product blocks start--}}
            @include('includes.product-blocks')
            {{--product blocks end--}}


            {{--product blocks start--}}
            @include('includes.product-blocks')
            {{--product blocks end--}}

            {{--product blocks start--}}
            @include('includes.product-blocks')
            {{--product blocks end--}}


            {{--product blocks start--}}
            @include('includes.product-blocks')
            {{--product blocks end--}}



        </div>



    </div>




@endsection
