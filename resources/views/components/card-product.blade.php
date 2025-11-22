@props([
     'id' =>'',
     'options' =>[],
     'condition' => 'new', // new | owned
     'favorite' => '', // new | owned
     'wrapperClass' =>''

])
@php
    $conditionColor  ='';
    $conditionText  ='';
    if($condition === 'new'){
        $conditionColor = 'bg-green-500 border-green-600';
        $conditionText = 'ახალი';
    }elseif ($condition === 'owned'){
        $conditionColor = 'bg-blue-500 border-blue-600';
        $conditionText = 'მეორადი';
    }
@endphp
<div {{ $attributes->merge(['class' => 'group']) }}>

    <div class="group flex flex-col h-auto  bg-white rounded-[8px] shadow-lg overflow-hidden py-3 relative {{ $wrapperClass }}">
        <a href="{{ route('pages.full-page') }}">
            <div class="group-hover:opacity-30 transition-opacity">
                <div class="absolute top-2 right-1">
                    <span class="border rounded-[10px] text-xs text-white px-[5px] py-[3px] italic shadow-lg {{ $conditionColor }}">{{ $conditionText }}</span>
                </div>
                <!-- Image -->
                <div class="flex items-center justify-center p-[10px]">
                    <img src="{{ $options['image'] }}" class="w-[256px] object-cover" alt="">
                </div>
            </div>
        </a>


        <!-- Text + Button -->
        <div class="flex flex-col flex-1 px-[15px]  md:justify-between ">
            <!-- Text -->
            <a href="{{ route('pages.full-page') }}">
                <div class="group-hover:opacity-30 transition-opacity">
                    <div class="space-y-[5px]">
                        <div class="text-[16px] font-custom-bold-upper text-[var(--color-main)] line-clamp-2">{{ $options['price'] }} ₾</div>
                        <div class="text-[12px] text-slate-800 line-clamp-2">{{ $options['title'] }}</div>
                    </div>
                </div>
            </a>


            <!-- Button -->
            <div class="text-center mt-[5px]">
                <div class="flex justify-between items-center gap-[10px]">

                    @php
                        $cardOptions = [
                            'data-product-id' => uniqid(),
                            'data-image' => $options['image'],
                            'data-title' => $options['title'],
                            'data-product-price' => $options['price']
                        ];
                     @endphp

                    <x-button size="sm" icon="phosphor-shopping-cart" class="w-full flex-1 add-to-cart-btn" iconPosition="left" variant="primary" :options="$cardOptions">დამატება</x-button>
                    <x-button size="sm" icon="phosphor-heart" class="{{ $favorite }} hidden md:block" variant="primary"  />
                </div>

            </div>

        </div>

    </div>

</div>
