@props(['id', 'image', 'title', 'price'])

<div id="cart-item-{{ $id }}" class="flex items-center gap-2 pr-[7px] cart-item">
    <img src="{{ $image }}" class="w-[40px] h-[40px] object-cover rounded">
    <div class="flex-1">
        <div class="text-[12px] font-bold">{{ $title }}</div>
        <div class="text-[12px] text-green-600">{{ $price }} ₾</div>
    </div>
    <x-dynamic-component :component="'phosphor-trash'"
                         class="h-[15px] w-[15px] remove-cart-item text-red-500 hover:text-red-700 cursor-pointer"/>
</div>
