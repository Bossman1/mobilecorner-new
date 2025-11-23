@extends('layouts.app')
@section('content')
    @php
        $optionsFilter = [
           '1' => 'ფილტრი',
           '2' => 'ფილტრი',
           '3' => 'ფილტრი',
           ];

    $brands = ['Apple', 'Samsung', 'Xiaomi', 'Huawei', 'Oppo', 'Vivo', 'Nokia', 'Realme', 'OnePlus', 'Sony', 'Asus', 'Google', 'Honor'];
    shuffle($brands);
    @endphp
    <div class="container mx-auto font-custom-regular relative">
        <x-page-component class="my-[20px]"  sidebar-class="bg-[var(--color-footer)] rounded-md hidden xl:block">
            <x-slot:sidebar>

                <div class="p-[16px]">
                    @include('includes.filter-content',['brands'=>$brands])
                </div>


            </x-slot:sidebar>
            <x-slot:content>
                <x-breadcrumbs />
                <div class="flex flex-col xl:!flex-row justify-start xl:!justify-between items-start xl:!items-center my-[16px]">
                    <div class="flex flex-col">
                        <div class="font-custom-bold-upper text-xl">Apple</div>
                        <div class="font-custom-bold-upper text-xs text-gray-500">ნაპოვნია - 20 ჩანაწერი</div>
                    </div>
                    <div class="flex justify-between items-center w-full xl:w-auto xl:!hidden">
                        <div class="flex justify-between items-center gap-2" id="filter-mobile-sort">
                            <x-dynamic-component :component="'phosphor-list'" class="h-[30px] w-[30px]"/>
                            <span class="leading-[16px]">ფილტრი</span>
                        </div>

                        <x-select class="w-full flex-1 !h-[50px] !pt-[14px] !text-sm" placeholder="სორტირტება" :options="$optionsFilter"/>
                    </div>
                </div>


                <div class="grid grid-cols-2 md:!grid-cols-4 gap-6">
                    @for($i = 0; $i < 12; $i++)
                        @php
                            $options = [
                                    'image' => asset('assets/images/temp/img1.webp'),
                                    'price' => rand(123,12338),
                                    'title' =>'Apple iPhone Air e-SIM | 256GB Sky Blue-'.rand(34,34565),
                              ];
                        $condition = rand(0, 1) ? 'new' : 'owned';
                        $favorite = rand(0, 1) ? '!bg-white !text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)]' : '!bg-[var(--color-favorite)]';
                        @endphp
                        <x-card-product wrapper-class="!shadow-[0_0_15px_rgba(0,0,0,0.15)]" :condition="$condition" :favorite="$favorite" :options="$options"/>
                    @endfor
                </div>

                {{--pagination wrapper start--}}
                    <div class="pagination-wrapper text-center my-[16px] md:my-[38px] md:h-[48px] md:py-[12px]">
                        pagination here
                    </div>
                {{--pagination wrapper end--}}

            </x-slot:content>
        </x-page-component>


    </div>

    <x-burger-slide-content burger-selector="filter-mobile-sort">
        @include('includes.filter-content',['brands'=>$brands])
    </x-burger-slide-content>
@endsection


@push('js')
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const searchInput = document.getElementById("filter-search-brand");
            const checkboxes = document.querySelectorAll('[name="models[]"]');

            searchInput.addEventListener("input", function () {
                const query = this.value.toLowerCase().trim();

                checkboxes.forEach(input => {
                    // outer wrapper div that wraps the x-checkbox component
                    const outerWrapper = input.closest('x-checkbox, div')?.parentElement || input.closest('div');

                    // find label inside the checkbox component
                    const labelEl = input.closest("div").querySelector("label");
                    const labelText = labelEl ? labelEl.textContent.toLowerCase().trim() : "";

                    if (labelText.includes(query)) {
                        outerWrapper.style.display = "";
                    } else {
                        outerWrapper.style.display = "none";
                    }
                });
            });
        });
    </script>


@endpush
