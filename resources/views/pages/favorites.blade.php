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
    <div class="container mx-auto font-custom-regular">

        <div class="mt-[32px]">
            <x-breadcrumbs />
            <div class="flex justify-between items-center my-[16px]">
                <div class="flex flex-col">
                    <div class="font-custom-bold-upper text-xl">რჩეულები</div>
                </div>
            </div>


            <div class="grid grid-cols-2 md:!grid-cols-3 xl:!grid-cols-4 gap-6">
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
        </div>
    </div>
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
