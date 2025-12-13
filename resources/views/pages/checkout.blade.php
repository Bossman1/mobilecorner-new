@extends('layouts.app')
@section('content')
    @php
        $options = [
           '1' => 'A ახალივით მდგომარეობაში 9.5/10',
           '2' => 'B მცირედი მოხმარების კვალით 8/10',
           '3' => 'C შესამჩნევი მოხმარების კვალი 6/10',
           ];

                $optionsRegionsCities = [

                    'თბილისი' => [
                        'თბილისი' => 'თბილისი',
                    ],

                    'აჭარა' => [
                        'ბათუმი' => 'ბათუმი',
                        'ქობულეთი' => 'ქობულეთი',
                        'ხელვაჩაური' => 'ხელვაჩაური',
                        'ქედა' => 'ქედა',
                        'შუახევი' => 'შუახევი',
                        'ხულო' => 'ხულო',
                    ],

                    'აფხაზეთი (დე იურე)' => [
                        'სოხუმი' => 'სოხუმი',
                        'გაგრა' => 'გაგრა',
                        'გუდაუთა' => 'გუდაუთა',
                        'ოჩამჩირე' => 'ოჩამჩირე',
                        'ტყვარჩელი' => 'ტყვარჩელი',
                        'გალი' => 'გალი',
                        'ახალი ათონი' => 'ახალი ათონი',
                    ],

                    'სამეგრელო-ზემო სვანეთი' => [
                        'ზუგდიდი' => 'ზუგდიდი',
                        'ფოთი' => 'ფოთი',
                        'სენაკი' => 'სენაკი',
                        'აბაშა' => 'აბაშა',
                        'წალენჯიხა' => 'წალენჯიხა',
                        'ხობი' => 'ხობი',
                        'ჯვარი' => 'ჯვარი',
                        'მესტია' => 'მესტია',
                    ],

                    'იმერეთი' => [
                        'ქუთაისი' => 'ქუთაისი',
                        'ზესტაფონი' => 'ზესტაფონი',
                        'სამტრედია' => 'სამტრედია',
                        'ჭიათურა' => 'ჭიათურა',
                        'ტყიბული' => 'ტყიბული',
                        'თერჯოლა' => 'თერჯოლა',
                        'ვანი' => 'ვანი',
                        'ხონი' => 'ხონი',
                        'წყალტუბო' => 'წყალტუბო',
                        'საჩხერე' => 'საჩხერე',
                        'ბაღდათი' => 'ბაღდათი',
                        'ხარაგაული' => 'ხარაგაული',
                        'სურამი' => 'სურამი',
                    ],

                    'გურია' => [
                        'ოზურგეთი' => 'ოზურგეთი',
                        'ლანჩხუთი' => 'ლანჩხუთი',
                        'ჩოხატაური' => 'ჩოხატაური',
                        'ნარუჯა' => 'ნარუჯა',
                    ],

                    'რაჭა-ლეჩხუმი და ქვემო სვანეთი' => [
                        'ონი' => 'ონი',
                        'ამბროლაური' => 'ამბროლაური',
                        'ცაგერი' => 'ცაგერი',
                        'ლენტეხი' => 'ლენტეხი',
                    ],

                    'შიდა ქართლი' => [
                        'გორი' => 'გორი',
                        'ქარელი' => 'ქარელი',
                        'კასპი' => 'კასპი',
                        'სურამი' => 'სურამი',
                    ],

                    'ქვემო ქართლი' => [
                        'რუსთავი' => 'რუსთავი',
                        'მარნეული' => 'მარნეული',
                        'ბოლნისი' => 'ბოლნისი',
                        'გარდაბანი' => 'გარდაბანი',
                        'დმანისი' => 'დმანისი',
                        'წალკა' => 'წალკა',
                    ],

                    'კახეთი' => [
                        'თელავი' => 'თელავი',
                        'გურჯაანი' => 'გურჯაანი',
                        'ყვარელი' => 'ყვარელი',
                        'სიღნაღი' => 'სიღნაღი',
                        'ლაგოდეხი' => 'ლაგოდეხი',
                        'დედოფლისწყარო' => 'დედოფლისწყარო',
                        'საგარეჯო' => 'საგარეჯო',
                        'წნორი' => 'წნორი',
                        'ვაჩნაძიანი' => 'ვაჩნაძიანი',
                    ],

                    'მცხეთა-მთიანეთი' => [
                        'მცხეთა' => 'მცხეთა',
                        'დუშეთი' => 'დუშეთი',
                        'თიანეთი' => 'თიანეთი',
                        'სტეფანწმინდა' => 'სტეფანწმინდა',
                        'ფასანაური' => 'ფასანაური',
                    ],

                    'სამცხე-ჯავახეთი' => [
                        'ახალციხე' => 'ახალციხე',
                        'ახალქალაქი' => 'ახალქალაქი',
                        'ნინოწმინდა' => 'ნინოწმინდა',
                        'ბორჯომი' => 'ბორჯომი',
                        'ვალე' => 'ვალე',
                        'ბაკურიანი' => 'ბაკურიანი',
                    ],
                ];

    $brands = ['Apple', 'Samsung', 'Xiaomi', 'Huawei', 'Oppo', 'Vivo', 'Nokia', 'Realme', 'OnePlus', 'Sony', 'Asus', 'Google', 'Honor'];
    shuffle($brands);
    $favoriteFullPage = rand(0, 1) ? '!text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)] !bg-[var(--color-second-header)]' : '!bg-[var(--color-favorite)]';
    @endphp
    <div class="container mx-auto font-custom-regular">

        <x-page-component position="right" class="!gap-[20px]"
                          content-class="my-[10px]"
                          sidebar-class="bg-[var(--color-second-header)] rounded-md xl:!w-[514px] sidebar-content-class transition-all duration-300 mt-[20px] order-2">
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
                                         text="განვადების შესავსებად აირჩიეთ სასურველი ბანკი"
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
                                <x-button size="sm" icon="phosphor-shopping-bag" data-purchase iconPosition="left" class="w-full"
                                          variant="primary">განვადებით ყიდვა
                                </x-button>
                            </div>
                        </div>

                    </div>


                </div>


            </x-slot:sidebar>
            <x-slot:content>


                <form class="user-information-form">
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
                                    <x-input class="w-full mt-[5px]" name="fname" placeholder="სახელი"/>
                                </div>

                                <div class="w-full">
                                    <label for="">გვარი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-input class="w-full mt-[5px]" name="lname" placeholder="გვარი"/>
                                </div>

                                <div class="w-full">
                                    <label for="">ტელეფონი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-input class="w-full mt-[5px]" name="phone" placeholder="ტელეფონი"/>
                                </div>

                                <div class="w-full">
                                    <label for="">ქალაქი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-select name="city" class="w-full flex-1 !h-[55px] !pt-[15px]  mt-[5px]" placeholder="ქალაქი"
                                              :options="$optionsRegionsCities"/>
                                </div>


                                <div class="w-full xl:!col-span-2">
                                    <label for="">ზუსტი მისამართი <span class="text-red-800 text-sm font-bold">*</span></label>
                                    <x-input class="w-full mt-[5px]" name="address" placeholder="ზუსტი მისამართი"/>
                                </div>
                                <div class="xl:!col-span-2">
                                    <label for="">კომენტარი</label>
                                    <x-textarea class="!w-full !h-[200px]  mt-[5px]" name="comment" placeholder="კომენტარი"/>
                                </div>
                            </div>


                        </div>
                    </section>

                    <x-line class="!border-t-[#EDEDED] !my-[13px]"/>

                    <div>
                        <p>ყურადღება!!!</p>

                        <p> "ონლაინ განვადების შევსებამდე დაუკავშირდით მაღაზიას და გადაამოწმეთ მარაგი!"</p>

                        <p> 597 04 04 45</p>

                    </div>
                </div>
                </form>

            </x-slot:content>


        </x-page-component>


        <div class="order-3 w-full">
            <x-line class="!mt-[10px]"/>
            <section class="grid grid-cols-1">
                <h2 class="text-sm font-custom-bold-upper my-[10px]">ახალი დამატებული პროდუქტები</h2>
                <x-carousel :autoplay="true" :pause-on-hover="true" :pagination="false" perPage="6"
                            perPageMobile="1" perPageTablet="3" splideTrackClass="padding-bottom:23px">
                    @foreach($newestProducts as $newestProduct)
                        @php
                            $productImage = json_decode($newestProduct->images)[0] ??  '';
                            $options = [
                               'image' => Voyager::image($productImage),
                                'price' => $newestProduct->a_old_price,
                                'old_price' => $newestProduct->a_new_price,
                                'title' => $newestProduct->title,
                                'id' => $newestProduct->id,
                                'slug' => $newestProduct->slug,
                              ];
                            $condition = $newestProduct->condition;
                        @endphp
                        <x-card-product :condition="$condition"   :options="$options"/>
                    @endforeach
                </x-carousel>
            </section>
        </div>
    </div>
@endsection


@push('js')

    <script src="https://webstatic.bog.ge/bog-sdk/bog-sdk.js?version=2&client_id={{ config('services.bog.client_id') }}"></script>
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
