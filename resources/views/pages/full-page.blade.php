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
    $favoriteFullPage = rand(0, 1) ? '!text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)] !bg-[var(--color-second-header)]' : '!bg-[var(--color-favorite)]';
    @endphp
    <div class="container mx-auto font-custom-regular">

        <x-page-component position="right" class="my-[20px] !gap-[20px]"
                          sidebar-class="bg-[var(--color-second-header)] rounded-md md:!w-[414px] sidebar-content-class transition-all duration-300">
            <x-slot:content>

                @php
                    $galleries = [
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'image title'],
                            ['thumb' =>  asset('assets/images/temp/img2.webp'), 'src' =>  asset('assets/images/temp/img2.webp'), 'caption' => 'image title'],
                            ['thumb' =>  asset('assets/images/temp/img3.webp'), 'src' =>  asset('assets/images/temp/img3.webp'), 'caption' => 'image title'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'image title'],
                            ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'image title'],
                             ['thumb' =>  asset('assets/images/temp/img1.webp'), 'src' =>  asset('assets/images/temp/img1.webp'), 'caption' => 'image title'],
                            ['thumb' =>  asset('assets/images/temp/img2.webp'), 'src' =>  asset('assets/images/temp/img2.webp'), 'caption' => 'image title'],
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

                <x-line class="!mt-[10px]" />

                 <section class="grid grid-cols-1">
                     <h2 class="text-sm font-custom-bold-upper my-[10px]">მსგავსი პროდუქტები</h2>
                    <x-carousel :autoplay="true" :pause-on-hover="true"  :pagination="false" perPage="4" perPageMobile="1" perPageTablet="5">
                        @for($i = 0; $i < 15; $i++)
                            @php
                                $options = [
                                        'image' => asset('assets/images/temp/img1.webp'),
                                        'price' => rand(123,12338),
                                        'title' =>'Apple iPhone Air e-SIM | 256GB Sky Blue-'.rand(34,34565),
                                  ];
                            $condition = rand(0, 1) ? 'new' : 'owned';
                            $favorite = rand(0, 1) ? '!bg-white !text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)]' : '!bg-[var(--color-favorite)]';
                            @endphp
                            <x-card-product :condition="$condition" :favorite="$favorite" :options="$options"/>
                        @endfor
                    </x-carousel>
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

                            <x-button size="sm" icon="phosphor-heart" class="{{ $favoriteFullPage }}" variant="primary"  />
                        </div>

                    </div>
                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>


                    <div>
                        <h2 class="text-sm font-custom-bold-upper my-[5px]">აირჩიეთ მობილურის კატეგორია</h2>
                        <div class="flex flex-col justify-between items-center gap-[7px] w-full">
                                 @php
                                     $radios = [
                                       ['label'=>'A)  ახალივით მდგომარეობაში 9.5/10','icon' => 'phosphor-radio-button','checked' => true,'value' => 1],
                                       ['label'=>'B)  მცირედი მოხმარების კვალით 8/10','icon' => 'phosphor-radio-button','value' => 2],
                                       ['label'=>'C)  შესამჩნევი მოხმარების კვალი 6/10','icon' => 'phosphor-radio-button','value' => 3]
                                     ]
                                 @endphp
                                 <x-radio-card label-class="!text-[12px]" text-position="right" iconClass="!w-[20px] !h-[20px]" name="payment_options" iconPosition="right" :options="$radios" />

                        </div>

                    </div>

                    <div class="mt-[16px]">
                        <div class="flex justify-start items-center gap-2">
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
            const hideAfter = 58;
            $(window).on('scroll', function() {
                const scrollTop = $(this).scrollTop();
                if (scrollTop > offsetTop) {
                    $sidebar.addClass('sticky top-[80px] shadow-lg');
                } else if(scrollTop < hideAfter) {
                    $sidebar.removeClass('sticky top-0 shadow-lg');
                }
            });
        });
    </script>
@endpush
