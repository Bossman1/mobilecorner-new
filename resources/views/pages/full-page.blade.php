@extends('layouts.app')
@section('content')
    @php
        $options = [
           '1' => 'A ახალივით მდგომარეობაში 9.5/10',
           '2' => 'B მცირედი მოხმარების კვალით 8/10',
           '3' => 'C შესამჩნევი მოხმარების კვალი 6/10',
           ];

    $brands = ['Apple', 'Samsung', 'Xiaomi', 'Huawei', 'Oppo', 'Vivo', 'Nokia', 'Realme', 'OnePlus', 'Sony', 'Asus', 'Google', 'Honor'];
    shuffle($brands);
    @endphp
    <div class="container mx-auto font-custom-regular">

        <x-page-component position="right" class="my-[20px] !gap-[20px]"
                          sidebar-class="bg-[var(--color-second-header)] rounded-md md:!w-[414px] sidebar-content-class transition-all duration-300">
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


                <div class="grid grid-cols-12 md:grid-cols-12 gap-5">
                    <div class="col-span-12 md:col-span-8">
                        <div class="flex justify-between items-center">
                            <x-breadcrumbs/>
                            <div class="text-sm text-slate-700">ID: 2342434</div>
                        </div>
                        <x-line class="!border-t-[#EDEDED] !my-[13px]"/>
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
                                    'condition' => 'owned'
                                ]"
                        />
                    </div>
                    <div class="col-span-12 md:col-span-4  font-custom-regular text-[14px]">
                        <section class="[&>*+*]:border-t [&>*+*]:border-gray-300 [&>*+*]:border-dotted">
                            @php
                                $details = [
                                    ['name'=>'გრაფიკული პროცესორი','value'=>'Adreno 830'],
                                    ['name'=>'რეზოლუცია','value'=>'QHD+'],
                                    ['name'=>'ეკრანის ზომა','value'=>'6.90 inches'],
                                    ['name'=>'განახლების სიხშირე','value'=>'120 Hz'],
                                    ['name'=>'ეკრანის ტიპი','value'=>'Dynamic AMOLED 2X'],
                                    ['name'=>'შიდა მეხსიერება','value'=>'256 GB'],
                                    ['name'=>'ოპერატიული მეხსიერება','value'=>'12 GB'],
                                    ['name'=>'ელემენტი','value'=>'5000 mAh'],
                                ];
                            @endphp

                            @foreach($details as $detail)
                                <div
                                    class="flex justify-between items-center  px-2 @if($loop->index == 0) py-4  @else py-4 @endif">
                                    <div class="text-gray-400 font-medium">{{ $detail['name'] }}</div>
                                    <div class="text-gray-900 font-semibold">{{ $detail['value'] }}</div>
                                </div>
                            @endforeach
                        </section>
                    </div>
                </div>


<x-line class="!mt-[10px]" />

                    <section class="my-[30px]">
                        <h2 class="text-sm font-custom-bold-upper my-[10px]">აირჩიეთ მობილურის კატეგორია</h2>
                        <div class="flex flex-wrap justify-start items-center gap-5">
                            <div class="flex justify-start items-center gap-2"><img alt="👏" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t57/1.5/16/1f44f.png">
                                ვიზუალური შეფასებით B კატეგორია</div>
                            <div class="flex justify-start items-center gap-2"><img alt="⏳" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t3e/1.5/16/23f3.png">
                                გარანტია 6 თვე</div>
                            <div class="flex justify-start items-center gap-2"><img alt="🔌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t99/1.5/16/1f50c.png">
                                აქსესუარები: ორიგინალი USB კაბელი</div>
                        </div>
                    </section>


                <section class="[&>*+*]:border-t [&>*+*]:border-gray-300 [&>*+*]:border-dotted">
                    @php
                        $details = [
                            ['name'=>'გრაფიკული პროცესორი','value'=>'Adreno 830'],
                            ['name'=>'რეზოლუცია','value'=>'QHD+'],
                            ['name'=>'ეკრანის ზომა','value'=>'6.90 inches'],
                            ['name'=>'განახლების სიხშირე','value'=>'120 Hz'],
                            ['name'=>'ეკრანის ტიპი','value'=>'Dynamic AMOLED 2X'],
                            ['name'=>'შიდა მეხსიერება','value'=>'256 GB'],
                            ['name'=>'ოპერატიული მეხსიერება','value'=>'12 GB'],
                            ['name'=>'ელემენტი','value'=>'5000 mAh'],
                        ];
                    @endphp

                    @foreach($details as $detail)
                        <div
                            class="flex justify-between items-center  px-2 @if($loop->index == 0) py-4  @else py-4 @endif">
                            <div class="text-gray-400 text-sm font-medium">{{ $detail['name'] }}</div>
                            <div class="text-gray-900 text-sm font-semibold">{{ $detail['value'] }}</div>
                        </div>
                    @endforeach
                </section>


            </x-slot:content>
            <x-slot:sidebar>

                <div class="p-[16px] sticky">

                    <div class="flex justify-between items-center">
                        <div class="flex justify-start items-center gap-2">
                            <div class="text-[20px] text-[var(--color-main)] font-custom-bold-upper">2899 ₾</div>
                            <div class="line-through text-[14px]">2999 ₾</div>
                        </div>

                        <div class="flex justify-start items-center gap-2">
                            <x-dynamic-component :component="'phosphor-warehouse'"
                                                 class="h-[15px] w-[15px] !text-black/80 group-hover:!text-white"/>
                            <span class="text-[12px] text-green-900 font-custom-bold-upper ">მარაგშია</span>
                            <span class="text-[12px] text-red-900 font-custom-bold-upper hidden">არ არის მარაგში</span>
                        </div>
                    </div>
                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>


                    <div>
                        <h2 class="text-sm font-custom-bold-upper">აირჩიეთ მობილურის კატეგორია</h2>
                        <div class="flex justify-between items-center gap-5 mt-[5px]">
                            <div class="flex-1">
                                <x-select class="w-full flex-1 !h-[50px] !pt-[14px] !text-sm" placeholder="ფასები"
                                          :options="$options"/>
                            </div>
                            <div>
                                <span class="text-xl text-[var(--color-main)] font-custom-bold-upper">12 ₾</span>
                            </div>
                        </div>

                    </div>

                    <div class="mt-[16px]">
                        <div class="flex justify-start items-center">
                            <h2 class="text-sm font-custom-bold-upper">ონლაინ განვადება</h2>
                            <span>
                            <x-tooltip icon="phosphor-warning-circle" iconClass="!w-[19.5px] !h-[19.5px]"
                                       text="აქ რამე ტექსტი დაიწერება"
                                       labelClass="!text-slate-500 !text-[11px] !px-0"
                                       contentClass="!bg-slate-700 !text-[11px] text-white whitespace-nowrap "/>
                            </span>
                        </div>
                        <div class="flex flex-col justify-between items-center  space-y-2 mt-[5px]">
                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <img src="https://sanstore.ge/TBC.png" alt="" class="w-[135px]  object-cover">
                            </div>
                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <img src="https://sanstore.ge/boglogo.png" alt="" class="w-[135px] object-cover">
                            </div>
                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <img src="https://sanstore.ge/credo.png" alt="" class="w-[135px] object-cover">
                            </div>

                        </div>

                    </div>


                </div>


            </x-slot:sidebar>

        </x-page-component>
    </div>
@endsection


@push('js')


    <script>
        $(function() {
            const $sidebar = $('.sidebar-content-class');
            const offsetTop = 100; // how far to scroll before sticking

            $(window).on('scroll', function() {
                if ($(window).scrollTop() > offsetTop) {
                    $sidebar.addClass('sticky top-[80px] shadow-lg');
                } else {
                    $sidebar.removeClass('sticky top-0 shadow-lg');
                }
            });
        });
    </script>
@endpush
