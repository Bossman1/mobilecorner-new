@props(['id', 'image', 'title', 'price'])

<div id="cart-item-{{ $id }}" class="flex items-center gap-2 pr-[7px] cart-item border-b border-gray-200 py-[10px]">
    <input type="hidden" name="cart_items[{{ $id }}][]" value="{{ $id }}">
    <input type="hidden" name="cart_price[{{$id}}][]" value="{{ $price }}">
    <input type="hidden" name="quantity[{{ $id }}][]" value="1">
    <input type="hidden" name="id" value="{{$id}}">
    <input type="hidden" name="price_category" value="{{$price_category}}">
    <img src="{{ $image }}" class="w-[60px] h-[60px] object-cover rounded">
    <div class="flex-1">
        <div class="text-[13px] font-custom-bold-upper">{{ $title }}</div>
        <div class="text-[13px] text-[var(--color-main)] font-custom-bold-upper">{{ $price }} ₾</div>
    </div>
    <div class="flex flex-col justify-between items-end gap-2 w-[63px]">

        <div class="items-end">
            <x-dynamic-component :component="'phosphor-trash'"  class="h-[17px] w-[17px] remove-cart-item text-gray-500 hover:text-red-700 cursor-pointer"/>
        </div>
        <div class="flex justify-between items-center gap-0.5  bg-[var(--color-main)] text-white text-sm rounded-md   p-[5px] w-full">

            <button class="h-[15px] w-[15px] cart-item-minus cursor-pointer">
                <x-dynamic-component :component="'phosphor-minus'"  class="h-[15px] w-[15px] cursor-pointer"/>
            </button>
            <div class="quantity" data-id="{{ $id }}">1</div>
            <button class="h-[15px] w-[15px] cart-item-plus cursor-pointer">
                <x-dynamic-component :component="'phosphor-plus'"  class="h-[15px] w-[15px]  cursor-pointer"/>
            </button>
        </div>

    </div>

</div>
