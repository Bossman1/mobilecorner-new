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
        <a href="{{ route('pages.full-page',$options['slug'] ?? 'temp-slug') }}">
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
            <a href="{{ route('pages.full-page', $options['slug'] ?? '') }}">
                <div class="group-hover:opacity-30 transition-opacity">
                    <div class="space-y-[5px]">
                        <div class="flex justify-start items-center gap-2">
                            @if(isset($options['old_price']) && trim($options['old_price']) !== '')
                                <div class="text-[16px] font-custom-bold-upper text-[var(--color-main)] line-clamp-2 ">{{ $options['old_price'] }} ₾</div>
                                <div class="text-[13px] font-custom-bold-upper text-gray-400 line-clamp-2 line-through">{{ $options['price'] }} ₾</div>
                            @else
                                <div class="text-[16px] font-custom-bold-upper text-[var(--color-main)] line-clamp-2">{{ $options['price'] }} ₾</div>
                            @endif
                        </div>

                        <div class="text-[12px] text-slate-800 line-clamp-2 min-h-[34px]">{{ $options['title'] }}</div>
                    </div>
                </div>
            </a>


            <!-- Button -->
            <div class="text-center mt-[5px]">
                <div class="flex justify-between items-center gap-[10px]">

                    @php
                        $cardOptions = [
                            'data-product-id' => $options['id'],
                            'data-image' => $options['image'],
                            'data-title' => $options['title'],
                            'data-product-price' => $options['price'],
                            'data-slug' => $options['slug'],
                        ];
                     @endphp

                    <x-button size="sm" icon="phosphor-shopping-cart" class="w-full flex-1 add-to-cart-btn" iconPosition="left" variant="primary" :options="$cardOptions">დამატება</x-button>

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

        </div>

    </div>

</div>
