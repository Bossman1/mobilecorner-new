<!-- ========================= -->
<!--        MOBILE HEADER      -->
<!-- ========================= -->
<div class="xl:hidden w-full bg-[var(--color-main)] text-white h-[58px] shadow-md relative z-[60] font-custom-regular sticky top-0">

    <div class="container mx-auto flex items-center justify-between h-full gap-4">



        <!-- Mobile Logo -->
        <a href="{{ route('home') }}" class="block flex-1">
            <img src="{{ asset('assets/images/logo-white.png') }}" class="min-w-[100px]" alt="Logo">
        </a>

         <x-button size="sm" icon="phosphor-magnifying-glass" class="!text-white !px-0" iconPosition="right" :options="[
            'aria-haspopup' => 'dialog',
            'aria-expanded' => 'false',
            'aria-controls' => 'hs-full-screen-modal',
            'data-hs-overlay' => '#hs-full-screen-modal'
        ]" variant="transparent"   />


        <a href="{{ route('pages.favorites') }}" class="relative ml-auto w-auto">
            <x-dynamic-component :component="'phosphor-heart'" class="h-7 w-7 text-white"/>
            <span id="fav-count" class="absolute -top-2 -right-2 bg-orange-500 text-white w-5 h-5 text-[11px] font-bold rounded-full flex items-center justify-center">5</span>
        </a>


        <!-- Cart -->
        <a href="{{ route('pages.cart') }}" class="relative ml-auto w-auto">
            <x-dynamic-component :component="'phosphor-shopping-cart'" class="h-7 w-7 text-white"/>
            <span id="m-cart-count" class="absolute -top-2 -right-2 bg-red-500 text-white w-5 h-5 text-[11px] rounded-full flex items-center justify-center invisible">0</span>
        </a>

        <!-- Burger Button -->
        <button id="mBurger" class="relative w-10 h-10 flex flex-col justify-center items-center group">
            <span class="block h-[3px] w-7 bg-white rounded transition-all duration-300 group-[.open]:rotate-45 group-[.open]:translate-y-2"></span>
            <span class="block h-[3px] w-7 bg-white rounded mt-1 transition-all duration-300 group-[.open]:opacity-0"></span>
            <span class="block h-[3px] w-7 bg-white rounded mt-1 transition-all duration-300 group-[.open]:-rotate-45 group-[.open]:-translate-y-2"></span>
        </button>

    </div>

</div>


<!-- ========================= -->
<!--     MOBILE SLIDE-IN MENU  -->
<!-- ========================= -->
<x-mobile-menu  :items="$mobileMenu" />

