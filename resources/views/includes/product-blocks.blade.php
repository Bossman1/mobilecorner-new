{{--product blocks start--}}
@if($category->all_products->count())
<div>
    <div class="flex justify-between items-center">
        <h2 class="text-[17px] font-custom-bold-upper my-[20px]">
            <a href="{{ route('pages.categories-list',$category->slug) }}">{{ $category->name ?? '' }}</a>
        </h2>
        <a href="{{ route('pages.categories-list',$category->slug) }}">
            <div class="flex justify-between items-center gap-1 group hover:text-[var(--color-main)] font-custom-regular">
                <span class="text-sm">ყველას ნახვა</span>
                <x-dynamic-component :component="'phosphor-arrow-square-out'" class="h-5 w-5 group-hover:text-[var(--color-main)]"/>
            </div>
        </a>
    </div>



    <div>
        <x-carousel  :pagination="false" perPage="6" perPageMobile="2" perPageTablet="3" type="slider">
            @foreach($category->all_products  as $product)
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
                    <x-card-product :condition="$condition"  :options="$options"/>
            @endforeach

        </x-carousel>
    </div>


    {{--category ads block start--}}
@if($category?->bannerGroup?->banners?->count())


        @php

            $bannerOptions = [];
            foreach ($category?->bannerGroup?->banners as $k => $banner){
                $bannerOptions[$k]['img'] =  Voyager::image($banner->image);
                $bannerOptions[$k]['url'] = $banner->link;
            }


        @endphp

        <x-products-ads-block :options="$bannerOptions" :bg-color="$category?->bannerGroup->bg_color" />
        {{--category ads block end--}}

        @endif


</div>
@endif
{{--product blocks end--}}
