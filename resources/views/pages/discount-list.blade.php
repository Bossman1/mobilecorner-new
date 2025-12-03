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
    <div class="container mx-auto font-custom-regular relative">
        <x-page-component class="my-[20px]"  sidebar-class="bg-[var(--color-footer)] rounded-md hidden xl:block sidebar-content-class transition-all duration-300 mt-[20px]">
            <x-slot:sidebar>




                <div class="p-[16px]">
                    <form class="js-filters-form">
                    @include('includes.filter-content',['brands'=>$brands,'attributeFilters'=>$attributeFilters, 'minPrice' => $minPrice, 'maxPrice' => $maxPrice])
                    </form>
                </div>


            </x-slot:sidebar>
            <x-slot:content>
                <x-breadcrumbs />
                <div class="flex flex-col xl:!flex-row justify-start xl:!justify-between items-start xl:!items-center my-[16px]">
                    <div class="flex flex-col">
                        <div class="font-custom-bold-upper text-xl">{{ isset($category) ? $category->name : $heading ?? ''  }}</div>
                        <div class="font-custom-bold-upper text-xs text-gray-500 ">ნაპოვნია - <span class="js-total-products">{{ $totalProducts }}</span> ჩანაწერი</div>
                    </div>
                    <div class="flex justify-between items-center w-full xl:w-auto xl:!hidden">
                        <div class="flex justify-between items-center gap-2" id="filter-mobile-sort">
                            <x-dynamic-component :component="'phosphor-list'" class="h-[30px] w-[30px]"/>
                            <span class="leading-[16px]">ფილტრი</span>
                        </div>

                        <x-select class="w-full flex-1 !h-[50px] !pt-[14px] !text-sm" placeholder="სორტირტება" :options="$optionsFilter"/>
                    </div>
                </div>


                <div id="product-wrapper" class="grid grid-cols-2 md:!grid-cols-3 gap-6">
                    @foreach($products as $product)

                        @php
                            $productImage = json_decode($product->images)[0] ??  '';
                            $options = [
                               'image' => Voyager::image($productImage),
                                'price' => $product->a_old_price,
                                'old_price' => $product->a_new_price,
                                'title' => $product->title,
                                'id' => $product->id,
                                'slug' => $product->slug,
                              ];
                            $condition = $product->condition;
                         @endphp

                        <x-card-product wrapper-class="!shadow-[0_0_15px_rgba(0,0,0,0.15)]" :condition="$condition"  :options="$options"/>
                    @endforeach


                </div>

                {{--pagination wrapper start--}}
                    <div class="pagination-wrapper text-center my-[16px] md:my-[38px] md:h-[48px] md:py-[12px]">
                        {{ $products->links() }}
                    </div>
                {{--pagination wrapper end--}}

            </x-slot:content>
        </x-page-component>


    </div>

    <x-burger-slide-content burger-selector="filter-mobile-sort">
        @include('includes.filter-content',['brands'=>$brands])
    </x-burger-slide-content>
@endsection


@push('js')
    <script>

    </script>


@endpush
