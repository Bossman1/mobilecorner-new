@extends('layouts.app')
@section('content')
    @php
        $options = [
           '1' => 'A ახალივით მდგომარეობაში 9.5/10',
           '2' => 'B მცირედი მოხმარების კვალით 8/10',
           '3' => 'C შესამჩნევი მოხმარების კვალი 6/10',
           ];

    $brands = ['Apple', 'Samsung', 'Xiaomi', 'Huawei', 'Oppo', 'Vivo', 'Nokia', 'Realme', 'OnePlus', 'Sony', 'Asus', 'Google', 'Honor'];
    shuffle($brands);
    $favoriteFullPage = rand(0, 1) ? '!text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)] !bg-[var(--color-second-header)]' : '!bg-[var(--color-favorite)]';
    @endphp
    <div class="container mx-auto font-custom-regular">

        <x-page-component position="right" class="!gap-[20px]"
                          sidebar-class="bg-[var(--color-second-header)] rounded-md md:!w-[414px] sidebar-content-class transition-all duration-300">
            <x-slot:content>


                <section class="grid grid-cols-1 md:grid-cols-12 gap-5 font-custom-regular">
                    <div class="mt-[20px]">
                        <div class="flex justify-between items-center">
                            <x-breadcrumbs/>
                        </div>
                        <x-line class="!border-t-[#EDEDED] !my-[13px]"/>

                        {{--cart items - start--}}

                            <!-- Page Heading -->
                        <div class="flex justify-between items-center  my-5">
                            <h1 class="text-xl font-custom-bold-upper">თქვენი კალათა</h1>
                            <div class="text-sm text-shadow-slate-800 font-custom-regular">პროდუქტის რაოდენობა: <span class="product-count">0</span></div>
                        </div>


                            <!-- Cart Table Headings -->
                            <div class="hidden md:flex justify-between items-start bg-gray-100 p-3 font-semibold text-gray-700 rounded-t">
                                <div class="w-20 ">#ID</div>
                                <div class="w-24 mx-4">Image</div>
                                <div class="flex-1">Title</div>
                                <div class="w-24">Price</div>
                                <div class="w-32 mx-4 ">Quantity</div>
                                <div class="w-24">Total</div>
                                <div class="w-12">Delete</div>
                            </div>

                            <!-- Cart Items List -->
                            <div id="cart-items"></div>
                            <div class="w-full  my-[20px] text-right">
                                <div><span class="font-custom-regular">ჯამი:</span> <span  id="grand-total" class="font-custom-bold-upper">0</span></div>
                            </div>


                        {{--cart items - end--}}

                    </div>
                </section>


                <x-line class="!mt-[10px]"/>

                <section class="grid grid-cols-1">
                    <h2 class="text-sm font-custom-bold-upper my-[10px]">მსგავსი პროდუქტები</h2>
                    <x-carousel :autoplay="true" :pause-on-hover="true" :pagination="false" perPage="4"
                                perPageMobile="1" perPageTablet="5">
                        @for($i = 0; $i < 15; $i++)
                            @php
                                $options = [
                                        'image' => asset('assets/images/temp/img1.webp'),
                                        'price' => rand(123,12338),
                                        'title' =>'Apple iPhone Air e-SIM | 256GB Sky Blue-'.rand(34,34565),
                                  ];
                            $condition = rand(0, 1) ? 'new' : 'owned';
                            $favorite = rand(0, 1) ? '!bg-white !text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)]' : '!bg-[var(--color-favorite)]';
                            @endphp
                            <x-card-product :condition="$condition" :favorite="$favorite" :options="$options"/>
                        @endfor
                    </x-carousel>
                </section>

            </x-slot:content>
            <x-slot:sidebar>

                <div class="p-[16px] sticky">

                    <div class="flex justify-between items-center">
                        <div class="flex justify-start items-center gap-2">
                            <div class="text-[20px] text-[var(--color-main)] font-custom-bold-upper">ჯამი: <span class="basket-price-sum"></span></div>
                        </div>

                    </div>
                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>



                    <div class="mt-[16px]">
                        <div class="flex justify-start items-center gap-2">
                            <h2 class="text-sm font-custom-bold-upper">ონლაინ განვადება</h2>
                            <span>
                              <x-tooltip icon="phosphor-warning-circle" iconClass="!w-[19.5px] !h-[19.5px]"
                                         text="აქ რამე ტექსტი დაიწერება"
                                         labelClass="!text-slate-500 !text-[11px] !px-0"
                                         contentClass="!bg-slate-700 !text-[11px] text-white whitespace-nowrap "/>
                            </span>
                        </div>
                        <div class="flex flex-col justify-between items-center  space-y-2 mt-[5px]">
                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <img src="https://sanstore.ge/TBC.png" alt="" class="w-[135px]  object-cover">
                            </div>
                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <img src="https://sanstore.ge/boglogo.png" alt="" class="w-[135px] object-cover">
                            </div>
                            <div
                                class="border border-gray-300 shadow-md w-full rounded-[4px] flex justify-center items-center bg-white">
                                <img src="https://sanstore.ge/credo.png" alt="" class="w-[135px] object-cover">
                            </div>

                        </div>

                    </div>


                </div>


            </x-slot:sidebar>

        </x-page-component>
    </div>
@endsection


@push('js')

    <script>
        $(function () {

            // Remove item
            window.removeFromCart = function(id) {
                let cart = JSON.parse(localStorage.getItem('cart')) || {};
                delete cart[id];
                localStorage.setItem('cart', JSON.stringify(cart));
                window.restoreCart();
                window.updateCartItemCount();
            }

            // Plus / Minus buttons
            $(document).on('click', '.cart-item-plus-list, .cart-item-minus-list', function () {
                let wrapper = $(this).closest('.cart-item');
                let qtyBox = wrapper.find('.quantity');
                let id = qtyBox.data('id');
                let qty = parseInt(qtyBox.text());
                let cart = JSON.parse(localStorage.getItem('cart')) || {};

                if ($(this).hasClass('cart-item-plus-list')) qty++;
                else if (qty > 1) qty--;

                qtyBox.text(qty);
                cart[id].qty = qty;
                localStorage.setItem('cart', JSON.stringify(cart));

                // Update subtotal
                let price = parseFloat(cart[id].price);
                wrapper.find('.subtotal').text((price * qty) + ' ₾');

                // Update grand total
                let grandTotal = 0;
                Object.values(cart).forEach(item => grandTotal += item.price * item.qty);
                $('#grand-total').text(grandTotal + ' ₾');
                window.restoreCart();
                window.updateCartItemCount();
            });

            window.renderCart();
        });
    </script>
@endpush
