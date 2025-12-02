{{--product blocks start--}}
@if($saledItemsOnly->count())
<div>
    <div class="flex justify-between items-center">
        <h2 class="text-[17px] font-custom-bold-upper my-[20px]">
            <a href="{{ route('discounted.products') }}">ფასდაკლებული პროდუქტები</a>
        </h2>
        <a href="{{ route('discounted.products') }}">
            <div class="flex justify-between items-center gap-1 group hover:text-[var(--color-main)] font-custom-regular">
                <span class="text-sm">ყველას ნახვა</span>
                <x-dynamic-component :component="'phosphor-arrow-square-out'" class="h-5 w-5 group-hover:text-[var(--color-main)]"/>
            </div>
        </a>
    </div>



    <div>
        <x-carousel  :pagination="false" perPage="6" perPageMobile="2" perPageTablet="3" type="slider" splideTrackClass="padding-bottom:23px">
            @foreach($saledItemsOnly  as $product)
                    @php
                        $productImage = json_decode($product->images)[0] ??  '';
                        $options = [
                                'image' => Voyager::image($productImage),
                                'price' => $product->a_old_price,
                                'old_price' => $product->a_new_price,
                                'title' => $product->title,
                                'id' => $product->id,
                                'slug' => $product->slug
                          ];
                    $condition = $product->condition;
                     @endphp
                    <x-card-product :condition="$condition"  :options="$options"/>
            @endforeach

        </x-carousel>
    </div>





</div>
@endif
{{--product blocks end--}}
