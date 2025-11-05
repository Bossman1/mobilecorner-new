<div id="main-header" class="shadow-md w-full z-50 h-fit hidden sm:block ">
    <div class="w-full text-white h-[58px] bg-[var(--color-main)]">
        <div class="container mx-auto h-full flex justify-between items-center font-custom-regular text-[12px]">

            <div class="items-start">
                <div class="flex justify-between items-center gap-[8px]">
                    <span> <x-dynamic-component :component="'phosphor-phone'" class="h-[24px] w-[24px]"/></span>
                    <span>+995 (32) 2 60 30 60</span>
                </div>
            </div>
            <div class="items-end">
                <ul class="flex justify-between items-center gap-[20px]">
                    <li class="menu-item"><a href="">მენიუ</a></li>
                    <li class="menu-item"><a href="">მენიუ</a></li>
                    <li class="menu-item"><a href="">მენიუ</a></li>
                    <li class="menu-item"><a href="">მენიუ</a></li>
                    <li class="menu-item"><a href="">მენიუ</a></li>
                </ul>
            </div>

        </div>
    </div>
</div>

<div id="secondary-header"
     class="w-full text-white h-[70px] bg-[var(--color-second-header)] absolute top-[58px] left-0 transition-all duration-300 transform translate-y-0 z-50 secondary-header shadow-[0_4px_6px_-1px_rgba(0,0,0,0.1),0_2px_4px_-2px_rgba(0,0,0,0.1)]">
    <div class="container mx-auto font-custom-regular">
        <div class="hidden md:block">
            <div class="flex items-center h-[70px]">
                <!-- Logo -->
                <div class="flex items-center h-full mr-6">
                    <a href=""><img src="{{ asset('assets/images/logo.png') }}" alt=""></a>
                </div>

                <!-- Navigation Button -->
                @include('includes.secondary-header-menu')
{{--                <div class="flex items-center h-full mr-4">--}}
{{--                    <x-button size="md" icon="phosphor-dots-nine" iconPosition="left" variant="primary" class="text-[18px]"--}}
{{--                              href="/">ნავიგაცია--}}
{{--                    </x-button>--}}
{{--                </div>--}}

                <!-- Search Input (takes remaining space) -->
                <div class="flex items-center h-full flex-1 mr-4">
                    <div class="flex w-full h-[48px]">
                        <!-- Icon -->
                        <a href="" class="flex">
                            <span class="flex items-center justify-center h-full border border-[var(--color-main)] rounded-l-[12px] !border-r-0 px-3 bg-white">
                                <x-dynamic-component :component="'phosphor-magnifying-glass'" class="h-6 w-6 text-[var(--color-main)]"/>
                            </span>
                        </a>

                        <!-- Input -->
                        <x-input :options="['autocomplete'=>'off']"
                                 class="flex-1 !h-full !rounded-none !border-[var(--color-main)] !border-l-0  focus:!outline-none focus:!ring-0 !rounded-r-[12px]"
                                 placeholder="ძიება"/>
                    </div>
                </div>

                <!-- Cart Button -->
                <div class="flex items-center h-full">
                    <x-button size="md" icon="phosphor-shopping-cart" iconPosition="left" variant="outline"
                              class="text-[18px]" href="/">კალათა
                    </x-button>
                </div>
            </div>
        </div>
    </div>

</div>
