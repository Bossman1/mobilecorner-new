@foreach($products as $product)

    <a href="{{ route('pages.full-page',$product->slug) }}" class="flex items-center gap-3 py-3 hover:bg-slate-50 transition">

        @php
            $productImage = json_decode($product->images)[0] ??  '';
        @endphp

        <div class="flex flex-col justify-center items-center gap-2 border border-[var(--color-main)]  rounded-lg p-3">
            <img src="{{ Voyager::image($productImage) }}" class="w-[100px] h-[100px] object-cover rounded">
            <div class="text-[14px] font-custom-bold-upper">{{ $product->title }}</div>
            <div class="text-[20px] text-[var(--color-main)] font-custom-bold-upper">{{ $product->final_price }} ₾</div>
        </div>
    </a>



@endforeach

