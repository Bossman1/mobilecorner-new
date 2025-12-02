@extends('layouts.app')
@section('content')
    @php
     $details1 = [];
     $details2 = [];
    if($product->attributes->isNotEmpty()){
            $chunks = $product->attributes->chunk(9);
        $firstEight   = $chunks->get(0); // first 8 attributes
        $remaining    = $chunks->get(1); // all others

        if(!is_null($firstEight)){

             foreach ($firstEight as $k =>  $attribute){
                $details1[$k]['name'] = $attribute->name;
                $details1[$k]['value'] = $attribute?->attribute_values?->value . ' ' . __($attribute->unit);
            }
        }
        if($remaining != null){
              foreach ($remaining as $k =>  $attribute){
                $details2[$k]['name'] = $attribute->name;
                $details2[$k]['value'] = $attribute?->attribute_values?->value . ' ' . __($attribute->unit);
            }
        }
    }

   $colorName = $product?->color?->name ?? '';
   $color = $product?->color?->color ?? "";
    @endphp
    <div class="container mx-auto font-custom-regular">

        <x-page-component position="right" class="my-[20px] !gap-[20px]"
                          sidebar-class="bg-[var(--color-second-header)] rounded-md xl:!w-[350px] 2xl:!w-[414px] sidebar-content-class transition-all duration-300 mt-[20px]">
            <x-slot:content>
                @php
                    $images = json_decode($product->images, true) ?: []; // ensures array
                    $galleries = array_map(function($image) use ($product) {
                        return [
                            'thumb' => Voyager::image($product->getThumbnail($image, 'medium')),
                            'src'   => Voyager::image($image),
                        ];
                    }, $images);
                @endphp


                <div class="grid grid-cols-12 md:grid-cols-12 gap-5">
                    <div class="col-span-12 md:col-span-8 mt-[20px]">
                        <div class="flex justify-between items-center">
                            <x-breadcrumbs/>
                            <div class="text-sm text-slate-700">ID: {{ $product->id }}</div>
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
                                    'condition' => $product->condition
                                ]"
                        />
                    </div>
                    <div class="col-span-12 md:col-span-4  font-custom-regular text-[14px]">
                        <section class="[&>*+*]:border-t [&>*+*]:border-gray-300 [&>*+*]:border-dotted">

                            @if(!empty($details1))
                                @foreach($details1 as $detail)
                                    <div
                                        class="flex justify-between items-center  px-2 py-4">
                                        <div class="text-gray-400 font-medium">{{ $detail['name'] }}</div>
                                        <div class="text-gray-900 font-semibold">{{ $detail['value'] }}</div>
                                    </div>
                                @endforeach
                            @endif
                            <div
                                class="flex justify-between items-center  px-2  py-4  ">
                                <div class="text-gray-400 font-medium">ფერი</div>
                                <div class="flex justify-start items-center gap-2">
                                    <div class="w-5 h-5 rounded-full overflow-hidden "
                                         style="background: {{ $color }};"></div>
                                    <div>{{ $colorName }}</div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>


                <x-line class="!mt-[10px]"/>
                @if(trim($product->description) !=='')
                    <section class="my-[30px]">
                        <h2 class="text-sm font-custom-bold-upper my-[10px]">აღწერა</h2>

                        <div class="flex flex-wrap justify-start items-center gap-5">
                            {!! $product->description !!}

                        </div>
                    </section>
                @endif


                <section class="my-[30px]">
                    <h2 class="text-sm font-custom-bold-upper my-[10px]">მიწოდების პირობები</h2>
                    <div class="flex flex-col justify-between items-center gap-5">
                        <div class="flex justify-between items-center w-full">
                            <div class="leading-[16px] flex justify-start items-center gap-1.5">
                                <div class=" rounded-full bg-white  p-1 text-[var(--color-main)]">
                                    <x-dynamic-component :component="'phosphor-map-pin-line'"
                                                         class="h-[24px] w-[24px]"/>
                                </div>
                                <div class="flex-1">ფილიალიდან გატანა</div>
                            </div>
                            <div class="flex-1 flex items-center mx-4">
                                <div class="w-full border-b border-dashed border-gray-300"></div>
                            </div>
                            <div class="leading-[16px] font-custom-bold">უფასო</div>
                        </div>

                        <div class="flex justify-between items-center w-full">
                            <div class="leading-[16px] flex justify-start items-center gap-1.5">
                                <div class=" rounded-full bg-white  p-1 text-[var(--color-main)]">
                                    <x-dynamic-component :component="'phosphor-moped'" class="h-[24px] w-[24px]"/>
                                </div>
                                <div class="flex-1">თბილისში მიწოდება</div>
                            </div>
                            <div class="flex-1 flex items-center mx-4">
                                <div class="w-full border-b border-dashed border-gray-300"></div>
                            </div>
                            <div class="leading-[16px] font-custom-bold">15 ₾</div>
                        </div>


                        <div class="flex justify-between items-center w-full">
                            <div class="leading-[16px] flex justify-start items-center gap-1.5">
                                <div class=" rounded-full bg-white  p-1 text-[var(--color-main)]">
                                    <x-dynamic-component :component="'phosphor-truck'" class="h-[24px] w-[24px]"/>
                                </div>
                                <div class="flex-1">რეგიონებში მიწოდება</div>
                            </div>
                            <div class="flex-1 flex items-center mx-4">
                                <div class="w-full border-b border-dashed border-gray-300"></div>
                            </div>
                            <div class="leading-[16px] font-custom-bold">15 ₾</div>
                        </div>


                    </div>
                </section>


                @if(!empty($details2))
                    <section class="[&>*+*]:border-t [&>*+*]:border-gray-300 [&>*+*]:border-dotted">
                        <h2 class="text-sm font-custom-bold-upper my-[10px]">დამატებითი მონაცემები</h2>


                        @foreach($details2 as $detail)
                            <div
                                class="flex justify-between items-center  px-2 @if($loop->index == 0) py-4  @else py-4 @endif">
                                <div class="text-gray-400 text-sm font-medium">{{ $detail['name'] }}</div>
                                <div class="text-gray-900 text-sm font-semibold">{{ $detail['value'] }}</div>
                            </div>
                        @endforeach
                    </section>
                @endif

                <x-line class="!mt-[10px]"/>


            </x-slot:content>
            <x-slot:sidebar>

                <div class="p-[16px] sticky">

                    <h2 class="text-[17px]  font-custom-bold-upper my-[5px] w-full">{{ $product->title }}</h2>

                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>
                    <div class="flex justify-between items-center">


                        <div id="price-wrapper" class="flex justify-start items-center gap-2 relative">

                            <!-- Loader (hidden by default) -->
                            <div id="price-loader" class="hidden absolute inset-0 flex items-center gap-2">
                                <div class="h-6 w-12 bg-gray-300 animate-pulse rounded"></div>
                                <div class="h-4 w-10 bg-gray-300 animate-pulse rounded"></div>
                            </div>

                            <!-- Actual price elements -->
                            <div class="flex items-center gap-2" id="price-content">
                                <div class="text-[20px] text-[var(--color-main)] font-custom-bold-upper" data-old-price>{{ trim($product->a_new_price) != '' ? $product->a_new_price : $product->a_old_price }} ₾ </div>
                                <div class="text-[14px] text-[var(--color-main)] font-custom-bold-upper line-through @if(trim($product->a_new_price) != '') opacity-100 @else opacity-0 @endif " data-new-price>{{ $product->a_old_price }} ₾ </div>
                            </div>

                        </div>

                        <div class="flex justify-start items-center gap-2">
                            <x-dynamic-component :component="'phosphor-warehouse'" class="h-[15px] w-[15px] !text-black/80 group-hover:!text-white"/>
                            <span class="text-[12px] @if(trim($product->stock) == 1) text-green-900 @elseif(trim($product->stock) == 2) text-red-900 @endif font-custom-bold-upper ">
                                @if(trim($product->stock) == 1)
                                    მარაგშია
                                @elseif(trim($product->stock) == 2)
                                    არ არის მარაგში
                                @endif
                            </span>

                            <x-button
                                size="sm"
                                icon="phosphor-heart"
                                data-id="{{ $options['id'] ?? '' }}"
                                data-btn-favorites
                                class="hidden md:block not-fav relative !pr-[8px]"
                                variant="primary"
                                iconCustomClass=" !mr-[0]"
                            >
                                <span class="btn-text"></span>
                                <span class="spinner absolute inset-0 flex items-center justify-center hidden">
                                    <svg class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z"></path>
                                    </svg>
                                </span>
                            </x-button>


                        </div>

                    </div>
                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>


                    <div>
                        <h2 class="text-sm font-custom-bold-upper my-[5px]">აირჩიეთ მობილურის კატეგორია</h2>
                        <div class="flex flex-col justify-between items-center gap-[7px] w-full">
                            @php

                            $conditions = [
                                1 => ['label' => 'A)  ახალივით მდგომარეობაში 9.5/10', 'field' => 'a_old_price'],
                                2 => ['label' => 'B)  მცირედი მოხმარების კვალით 8/10', 'field' => 'b_old_price'],
                                3 => ['label' => 'C)  შესამჩნევი მოხმარების კვალი 6/10', 'field' => 'c_old_price'],
                            ];

                            $radios = [];
                            $firstAdded = false;

                            foreach ($conditions as $value => $data) {
                                if (trim($product->{$data['field']}) !== '') {

                                    $item = [
                                        'label' => $data['label'],
                                        'icon'  => 'phosphor-radio-button',
                                        'value' => $value
                                    ];


                                    if (!$firstAdded) {
                                        $item['checked'] = true;
                                        $firstAdded = true;
                                    }

                                    $radios[] = $item;
                                }
                            }

                            @endphp
                            <x-radio-card label-class="!text-[12px]" text-position="right"
                                          iconClass="!w-[20px] !h-[20px]" name="payment_options" iconPosition="right"
                                          :options="$radios" :ajax="true"  :ajax="true"  :dataAttributes="['data-radio-ajax' => true]"   />

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
                                <a href="{{ route('pages.checkout') }}">
                                    <img src="{{ asset('assets/images/TBC.png') }}" alt=""
                                         class="w-[135px] object-cover transition duration-500 hover:scale-105 ">
                                </a>
                            </div>

                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <a href="{{ route('pages.checkout') }}">
                                    <img src="{{ asset('assets/images/boglogo.png') }}" alt=""
                                         class="w-[135px] object-cover transition duration-500 hover:scale-105 ">
                                </a>
                            </div>
                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <a href="{{ route('pages.checkout') }}">
                                    <img src="{{ asset('assets/images/credo.png') }}" alt=""
                                         class="w-[135px] object-cover transition duration-500 hover:scale-105 ">
                                </a>
                            </div>

                        </div>

                    </div>

                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>

                    <div class="flex flex-col justify-between items-center mt-[16px] gap-[7px]">
                        <x-button on size="sm" icon="phosphor-shopping-cart" iconPosition="left" class="w-full"
                                  variant="outline" href="{{ route('pages.cart') }}">კალათის ნახვა
                        </x-button>


                        @php
                            $productImage = json_decode($product->images)[0] ??  '';
                            $cardOptions = [
                                'data-product-id' => $product->id,
                                'data-image' => Voyager::image($productImage),
                                'data-title' => $product->title,
                                'data-slug' => $product->slug,
                            ];
                        @endphp

                        <x-button size="sm" icon="phosphor-shopping-bag" add-to-cart-and-checkout-btn  :options="$cardOptions" iconPosition="left" class="w-full" variant="primary">
                            ყიდვა
                        </x-button>

                    </div>

                </div>


            </x-slot:sidebar>

        </x-page-component>

        @if($relatedProducts->isNotEmpty())
            <section class="grid grid-cols-1">
                <h2 class="text-sm font-custom-bold-upper my-[10px]">მსგავსი პროდუქტები</h2>
                <x-carousel :autoplay="true" :pause-on-hover="true" :pagination="false" perPage="4" perPageMobile="1" perPageTablet="3" type="slider">

                    @foreach($relatedProducts as $relatedProduct)
                        @php
                            $productImage = json_decode($relatedProduct->images)[0] ??  '';
                            $options = [
                                   'image' => Voyager::image($productImage),
                                   'price' => $relatedProduct->a_old_price,
                                   'old_price' => $relatedProduct->a_new_price,
                                   'title' => $relatedProduct->title,
                                   'id' => $relatedProduct->id,
                                   'slug' => $relatedProduct->slug,
                             ];
                       $condition = $relatedProduct->condition;

                        @endphp
                        <x-card-product :condition="$condition" :options="$options"/>
                    @endforeach


                </x-carousel>
            </section>
        @endif
    </div>
@endsection



@push('js')

    <script>
        $(function (){

           $(document).on('click', '[data-radio-ajax]', function (e){

               let $this = $(this);
               let $id = {{ $product->id }};
               let $optionId = $this.val();
               let new_price_wrp =  $("[data-new-price]");
               let old_price_wrp =  $("[data-old-price]");

               $.ajax({
                   url: '{{ route('ajax.call') }}',
                   type: 'POST',
                   data: {
                       action: 'getPriceById',
                       value:{id:$id,optionId:$optionId },
                       _token: $('meta[name="csrf-token"]').attr('content')
                   },
                   beforeSend: function () {
                       // Show loader, hide prices
                       $('#price-content').addClass('opacity-0');
                       $('#price-loader').removeClass('hidden');
                       new_price_wrp.addClass('opacity-0');

                   },
                   success: function (response) {

                           if(response && response.success === true){
                               old_price_wrp.text("");
                               new_price_wrp.text("");

                               if(response.old_price && response.new_price){
                                   old_price_wrp.text(response.new_price + ' ₾');
                                   new_price_wrp.text(response.old_price + ' ₾');
                                   new_price_wrp.removeClass('opacity-0');
                               }
                               if(response.new_price && !response.old_price){
                                   new_price_wrp.text(response.new_price + ' ₾');
                               }

                               if(response.old_price &&  !response.new_price){
                                   old_price_wrp.text(response.old_price + ' ₾');
                               }

                               window.applyRadioUI($this);
                           }

                   },
                   complete: function () {
                       // Hide loader, show updated prices
                       $('#price-loader').addClass('hidden');
                       $('#price-content').removeClass('opacity-0');
                   }
               });
           });

        });
    </script>
@endpush
