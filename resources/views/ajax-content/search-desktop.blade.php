@foreach($products as $product)

    <a href="{{ route('pages.full-page',$product->slug) }}"
       class="flex items-center gap-3 py-3 hover:bg-slate-50 transition">

        @php
            $productImage = json_decode($product->images)[0] ??  '';
        @endphp

        <div class="w-[80px] h-[80px] overflow-hidden rounded-[10px]">
            <img src="{{ Voyager::image($productImage) }}"
                 class="w-full h-full object-cover"
                 alt="">
        </div>

        <!-- This flex-1 pushes everything else to the right -->
        <div class="flex flex-col flex-1 gap-[5px]">
            <div class="font-custom-bold-upper text-[var(--color-main)]">{{ $product->title }}</div>
            <div class="text-[14px] text-[var(--color-main)]">{{ $product->final_price }} ₾</div>
        </div>

        <!-- Button aligned right -->
        <div class="ml-auto pr-[10px]">
            <div  class="items-center justify-center transition select-none cursor-pointer bg-[var(--color-main)] text-white hover:bg-[var(--color-main-hover)] py-[8px] pr-[8px] pl-[12px] rounded-[4px]  inline-flex w-full flex-1">
                <span class=" text-[14px] leading-[14px] ">ნახვა</span>
                <svg class="w-6 h-6 ml-[4px]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M181.66,133.66l-80,80a8,8,0,0,1-11.32-11.32L164.69,128,90.34,53.66a8,8,0,0,1,11.32-11.32l80,80A8,8,0,0,1,181.66,133.66Z"></path></svg>
            </div>
        </div>

    </a>
@endforeach
