<!-- ========================= -->
<!--        MOBILE HEADER      -->
<!-- ========================= -->
<div class="xl:hidden w-full bg-[var(--color-main)] text-white h-[58px] shadow-md relative z-[60] font-custom-regular">

    <div class="container mx-auto flex items-center justify-between h-full">

        <!-- Burger Button -->
        <button id="mBurger" class="relative w-10 h-10 flex flex-col justify-center items-center group">
            <span class="block h-[3px] w-7 bg-white rounded transition-all duration-300 group-[.open]:rotate-45 group-[.open]:translate-y-2"></span>
            <span class="block h-[3px] w-7 bg-white rounded mt-1 transition-all duration-300 group-[.open]:opacity-0"></span>
            <span class="block h-[3px] w-7 bg-white rounded mt-1 transition-all duration-300 group-[.open]:-rotate-45 group-[.open]:-translate-y-2"></span>
        </button>

        <!-- Mobile Logo -->
        <a href="{{ route('home') }}" class="block">
            <img src="{{ asset('assets/images/logo.png') }}" class="h-[40px]" alt="Logo">
        </a>

        <!-- Cart -->
        <a href="{{ route('pages.cart') }}" class="relative">
            <x-dynamic-component :component="'phosphor-shopping-cart'" class="h-7 w-7 text-white"/>
            <span id="m-cart-count" class="absolute -top-2 -right-2 bg-red-500 text-white w-5 h-5 text-[11px] rounded-full flex items-center justify-center hidden">0</span>
        </a>

    </div>
</div>


<!-- ========================= -->
<!--     MOBILE MENU OVERLAY   -->
<!-- ========================= -->
<div id="mOverlay"
     class="fixed inset-0 bg-black/40 backdrop-blur-sm opacity-0 pointer-events-none transition-all duration-300 z-[59]"></div>


<!-- ========================= -->
<!--     MOBILE SLIDE-IN MENU  -->
<!-- ========================= -->
<nav id="mMenu"
     class="fixed left-0 top-0 h-full w-[82%] max-w-[320px] bg-white shadow-2xl text-black
            -translate-x-full transition-transform duration-300 overflow-y-auto z-[60] font-custom-regular">

    <div class="p-4">

        <!-- Search Bar -->
        <div class="flex mb-6">
            <span class="flex items-center justify-center h-[48px] w-[48px] border border-[var(--color-main)] border-r-0 rounded-l-[12px] bg-white">
                <x-dynamic-component :component="'phosphor-magnifying-glass'" class="h-6 w-6 text-[var(--color-main)]"/>
            </span>
            <input type="text"
                   class="flex-1 h-[48px] rounded-r-[12px] border border-[var(--color-main)] focus:outline-none px-3"
                   placeholder="ძიება">
        </div>

        <!-- Menu Items -->
        <ul class="space-y-2">

            <li><a href="{{ route('home') }}" class="block px-3 py-2 rounded hover:bg-gray-100">მთავარი</a></li>

            <li>
                <button class="w-full flex justify-between items-center px-3 py-2 rounded hover:bg-gray-100 mParent">
                    <span>პროდუქტები</span>
                    <span class="mArrow transition-transform">⌄</span>
                </button>

                <ul class="mChild max-h-0 overflow-hidden pl-6 transition-all duration-300 space-y-2">

                    <li>
                        <button class="w-full flex justify-between items-center px-2 py-2 rounded hover:bg-gray-100 mSubParent">
                            <span>ტელეფონები</span>
                            <span class="mSubArrow transition-transform">⌄</span>
                        </button>

                        <ul class="mSubChild max-h-0 overflow-hidden pl-4 transition-all duration-300 space-y-2">
                            <li><a href="#" class="block px-2 py-2 rounded hover:bg-gray-100">iPhone</a></li>
                            <li><a href="#" class="block px-2 py-2 rounded hover:bg-gray-100">Samsung</a></li>
                            <li><a href="#" class="block px-2 py-2 rounded hover:bg-gray-100">Xiaomi</a></li>
                        </ul>
                    </li>

                    <li><a href="#" class="block px-2 py-2 rounded hover:bg-gray-100">ლეპტოპები</a></li>
                    <li><a href="#" class="block px-2 py-2 rounded hover:bg-gray-100">აქსესუარები</a></li>
                </ul>
            </li>

            <li><a href="{{ route('pages.contact') }}" class="block px-3 py-2 rounded hover:bg-gray-100">კონტაქტი</a></li>

        </ul>

    </div>
</nav>
