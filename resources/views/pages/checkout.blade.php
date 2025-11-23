@extends('layouts.app')
@section('content')
    @php
        $options = [
           '1' => 'A ახალივით მდგომარეობაში 9.5/10',
           '2' => 'B მცირედი მოხმარების კვალით 8/10',
           '3' => 'C შესამჩნევი მოხმარების კვალი 6/10',
           ];

        $optionsCities = [
               '1' => 'თბილისი',
               '2' => 'რუსთავი',
               '3' => 'ქუთაისი',
           ];

    $brands = ['Apple', 'Samsung', 'Xiaomi', 'Huawei', 'Oppo', 'Vivo', 'Nokia', 'Realme', 'OnePlus', 'Sony', 'Asus', 'Google', 'Honor'];
    shuffle($brands);
    $favoriteFullPage = rand(0, 1) ? '!text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)] !bg-[var(--color-second-header)]' : '!bg-[var(--color-favorite)]';
    @endphp
    <div class="container mx-auto font-custom-regular">

        <x-page-component position="right" class="!gap-[20px]"
                          content-class="my-[10px]"
                          sidebar-class="bg-[var(--color-second-header)] rounded-md md:!w-[514px] sidebar-content-class transition-all duration-300 mt-[20px] order-2">
            <x-slot:sidebar>

                <div class="p-[16px] sticky">

                    <h2 class="text-sm font-custom-bold-upper">პროდუქტი</h2>
                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>

                    <div id="checkout-product-list-wrapper" class="flex flex-col"></div>


                    <div class="flex justify-end items-center mt-[15px]">
                        <div class="flex justify-end items-center gap-2">
                            <div class="text-[20px]  font-custom-bold-upper ml-auto">მთლიანი ჯამი: <span
                                    class="basket-price-sum text-[var(--color-main)]"></span></div>
                        </div>

                    </div>
                    <x-line class="!border-t-[#dfd5d5] !my-[13px]"/>


                    <div class="mt-[16px]">
                        <div class="flex justify-start items-center gap-2">
                            <h2 class="text-sm font-custom-bold-upper">აირჩიეთ ბანკი</h2>
                            <span>
                              <x-tooltip icon="phosphor-warning-circle" iconClass="!w-[19.5px] !h-[19.5px]"
                                         text="აქ რამე ტექსტი დაიწერება"
                                         labelClass="!text-slate-500 !text-[11px] !px-0"
                                         contentClass="!bg-slate-700 !text-[11px] text-white whitespace-nowrap "/>
                            </span>
                        </div>
                        <div class="flex flex-col justify-between items-center  space-y-2 mt-[5px]">
                            <div class="flex flex-col justify-between items-center gap-[7px] w-full">
                                @php
                                    $radios = [
                                      ['label'=>'თბს ბანკი','image' => asset('assets/images/TBC.png'),'value' => 1],
                                      ['label'=>'კრედო ბანკი','image' => asset('assets/images/credo.png'),'value' => 2],
                                      ['label'=>'საქართცელოს ბანკი','image' => asset('assets/images/boglogo.png'),'value' => 3]
                                    ]
                                @endphp
                                <x-radio-card
                                    image-class="object-cover w-[100px] bg-white rounded-[5px] overflow-hidden p-2"
                                    label-class="!text-[14px]" text-position="right" iconClass="!w-[20px] !h-[20px]"
                                    name="payment_options" iconPosition="right" :options="$radios"/>
                            </div>

                            <div class="flex flex-col justify-between items-center mt-[16px] gap-[7px] w-full">
                                <x-button size="sm" icon="phosphor-shopping-bag" iconPosition="left" class="w-full"
                                          variant="primary" href="{{ route('pages.checkout') }}">განვადებით ყიდვა
                                </x-button>
                            </div>
                        </div>

                    </div>


                </div>


            </x-slot:sidebar>
            <x-slot:content>


                <div class="order-1">
                    <section class="grid grid-cols-1 md:grid-cols-12 gap-5 font-custom-regular">
                        <div class="mt-[20px]">
                            <div class="flex justify-between items-center">
                                <x-breadcrumbs/>
                            </div>
                            <x-line class="!border-t-[#EDEDED] !my-[13px]"/>


                            <!-- Page Heading -->
                            <div class="flex justify-between items-center  my-5">
                                <h1 class="text-xl font-custom-bold-upper">მყიდველის მონაცემები</h1>
                            </div>


                            <div class="grid grid-cols-1 xl:!grid-cols-2 gap-5">
                                <div class="w-full">
                                    <label for="">სახელი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-input class="w-full mt-[5px]" placeholder="სახელი"/>
                                </div>

                                <div class="w-full">
                                    <label for="">გვარი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-input class="w-full mt-[5px]" placeholder="გვარი"/>
                                </div>

                                <div class="w-full">
                                    <label for="">ტელეფონი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-input class="w-full mt-[5px]" placeholder="ტელეფონი"/>
                                </div>

                                <div class="w-full">
                                    <label for="">ქალაქი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-select class="w-full flex-1 !h-[55px] !pt-[15px]  mt-[5px]" placeholder="ქალაქი"
                                              :options="$optionsCities"/>
                                </div>


                                <div class="w-full xl:!col-span-2">
                                    <label for="">ზუსტი მისამართი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-input class="w-full mt-[5px]" placeholder="ზუსტი მისამართი"/>
                                </div>
                                <div class="xl:!col-span-2">
                                    <label for="">კომენტარი</label>
                                    <x-textarea class="!w-full !h-[200px]  mt-[5px]" placeholder="კომენტარი"/>
                                </div>
                            </div>


                        </div>
                    </section>

                    <x-line class="!border-t-[#EDEDED] !my-[13px]"/>

                    <div>
                        <p>ყურადღება!!!</p>

                        <p> "ონლაინ განვადების შევსებამდე დაუკავშირდით მაღაზიას და გადაამოწმეთ მარაგი!"</p>

                        <p> 597 04 04 45</p>

                        <p> ნივთის ონლაინ შეძენის შემთხვევაში, აჭერთ ღილაკს "ყიდვა" შერჩეული ნივთი დაემატება თქვენს
                            კალათაში, შეკვეთის დასასრულებლად საჭიროა გადახვიდეთ კალათაში და მიყვეთ არსებულ
                            ინსტრუქციას!</p>
                        <p> განვადებით შეძენის შემთხვევაში ირჩევთ სასურველი ბანკის ღილაკს და მიყვებით ინსტრუქციას
                        </p>
                        <p>აქ ადმინკიდან დაწერ რაც გინდა იმას!!!!!</p>
                    </div>
                </div>


            </x-slot:content>


        </x-page-component>


        <div class="order-3 w-full">
            <x-line class="!mt-[10px]"/>
            <section class="grid grid-cols-1">
                <h2 class="text-sm font-custom-bold-upper my-[10px]">მსგავსი პროდუქტები</h2>
                <x-carousel :autoplay="true" :pause-on-hover="true" :pagination="false" perPage="6"
                            perPageMobile="1" perPageTablet="3">
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
        </div>
    </div>
@endsection


@push('js')

    <script>
        $(function () {

            // Remove item
            window.removeFromCart = function (id) {
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
