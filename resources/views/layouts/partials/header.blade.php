<!-- ========================= -->
<!-- DESKTOP HEADER (xl and up) -->
<!-- ========================= -->
<div id="main-header" class="shadow-md w-full z-50 h-fit hidden xl:block">
    <div class="w-full text-white h-[58px] bg-[var(--color-main)]">
        <div class="container mx-auto h-full flex justify-between items-center font-custom-regular text-[12px]">

            <div class="items-start">
                <div class="flex justify-between items-center gap-[8px]">
                    <span><x-dynamic-component :component="'phosphor-phone'" class="h-[24px] w-[24px]"/></span>
                    <span>+995 (32) 2 60 30 60</span>
                </div>
            </div>

            <div class="items-end">
                <ul class="flex justify-between items-center gap-[20px]">
                    @if(isset($staticPages) && count($staticPages) > 0)
                        @foreach($staticPages as $staticPage)
                            @if(in_array($staticPage->position,['everywhere','header']))
                                <li><a href="{{ route('pages.page',$staticPage->slug) }}">{{ $staticPage->title }}</a></li>
                            @endif
                        @endforeach
                    @endif
                    <li><a href="{{ route('pages.contact') }}">კონტაქტი</a></li>
                </ul>
            </div>

        </div>
    </div>
</div>


<!-- SECONDARY DESKTOP HEADER -->
<div id="secondary-header"
     class="w-full h-[70px] bg-[var(--color-second-header)] absolute top-[58px] left-0 transition-all duration-300 transform translate-y-0 z-50 secondary-header   shadow-[0_4px_6px_-1px_rgba(0,0,0,0.1),0_2px_4px_-2px_rgba(0,0,0,0.1)] hidden xl:block">
    <div class="container mx-auto h-full flex items-center gap-[15px] font-custom-regular">

        <!-- Logo -->
        <div class="flex items-center h-full mr-6">
            <a href="{{ route('home') }}"><img src="{{ asset('assets/images/logo.png') }}" alt=""></a>
        </div>

        @include('includes.secondary-header-menu')

        <!-- Search -->
        <div class="flex items-center h-full flex-1 mr-4">
            <div class="flex w-full h-[48px]">
                <a href="" class="flex">
                    <span class="flex items-center justify-center h-full border border-[var(--color-main)] rounded-l-[12px] !border-r-0 px-3 bg-white">
                        <x-dynamic-component :component="'phosphor-magnifying-glass'" class="h-6 w-6 text-[var(--color-main)]"/>
                    </span>
                </a>
                <x-input class="flex-1 !h-full !rounded-none !border-[var(--color-main)] !border-l-0 focus:!outline-none !rounded-r-[12px]"
                         placeholder="ძიება"/>
            </div>
        </div>

        <!-- Favorites + Cart -->
        <div class="gap-[15px] flex items-center relative">
            <x-button id="fav-btn" size="sm" icon="phosphor-heart" variant="outline"
                      class="text-[18px] !rounded-full relative !pr-[8px]" iconCustomClass="!mr-0"
                      href="{{ route('pages.favorites') }}">
                <span id="fav-count" data-fav-count class="absolute -top-2 -right-2 bg-orange-500 text-white w-5 h-5 text-[11px] font-bold rounded-full flex items-center justify-center hidden">0</span>
            </x-button>

            <div class="flex items-center relative" id="cart-container">
                <x-button id="cart-btn" size="md" icon="phosphor-shopping-cart" iconPosition="left" variant="outline" href="{{ route('pages.cart') }}"
                          class="text-[18px] relative">
                    კალათა
                    <span id="cart-count" class="absolute -top-2 -right-2 bg-red-500 text-white w-5 h-5 text-[11px] rounded-full flex items-center justify-center">0</span>
                </x-button>


                <div id="mini-cart"
                class="absolute top-[62px] right-0 w-[360px] bg-white text-black shadow-lg rounded-[10px] p-4 opacity-0 invisible transition-opacity duration-300 border border-[var(--color-main)]">
                <!-- Arrow -->
                <span class="w-[15px] h-[15px] right-[52px] bg-white top-[-8px] rotate-45 border-t border-l border-[var(--color-main)] absolute"></span>

                <!-- Title -->
                <div class="flex justify-between items-center px-[10px] text-xs">
                    <div>კალათა</div>
                    <div><span class="product-count">0</span> პროდუქტი</div>
                </div>

                <!-- Items container -->
                <div id="mini-cart-items" class="space-y-2 h-[250px] overflow-y-auto pt-[10px]">
                    <!-- Placeholder if empty -->
                    <div id="cart-placeholder" class="flex flex-col items-center justify-center py-10 text-center text-slate-500">
                        <img src="{{ asset('assets/images/cart-basket.png') }}" alt="Empty cart" class="w-24 h-24 mb-4 opacity-50">
                        <span>თქვენი კალათა ცარიელია</span>
                    </div>
                </div>

                <!-- View Cart Button -->
                <div class="mt-[10px]">
                    <div class="flex justify-end  items-end font-custom-regular text-sm mb-[10px]">
                        <div><span>ჯამური ფასი:</span> <span class="font-custom-bold-upper basket-price-sum">0₾</span></div>
                    </div>
                    <x-button size="sm" icon="phosphor-shopping-cart" iconPosition="left" variant="primary" class="w-full" id="view-cart-btn" href="{{ route('pages.cart') }}">
                        კალათის ნახვა
                    </x-button>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>


@include('layouts.partials.mobile-menu')

