@props([
     'id' =>'',
     'options' =>[],

])
<div {{ $attributes->merge(['class' => 'group']) }}>

    <div class="group flex flex-col h-[300px] md:h-[335px] bg-white rounded-[8px] shadow-md overflow-hidden py-3">
        <!-- Image -->
        <a href="">
            <div class="group-hover:opacity-30 transition-opacity duration-200 p-[10px]">
                <img src="{{ $options['image'] }}" class="w-[256px]  object-cover" alt="">
            </div>
        </a>

        <!-- Text + Button -->
        <div class="flex flex-col flex-1 px-[15px]  md:justify-between ">
            <!-- Text -->
            <a href="" class="space-y-[5px]">
                <div class="text-[16px] font-custom-bold-upper text-[var(--color-main)] line-clamp-2">{{ $options['price'] }} ₾</div>
                <div class="text-[12px] text-slate-800 line-clamp-2">{{ $options['title'] }}</div>
            </a>

            <!-- Button -->
            <div class="text-center mt-[5px]">
                <x-button size="sm" icon="phosphor-shopping-cart" iconPosition="left" variant="primary">
                    დამატება
                </x-button>
            </div>
        </div>
    </div>

</div>
