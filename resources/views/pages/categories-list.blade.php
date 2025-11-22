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
        <x-page-component class="my-[20px]"  sidebar-class="bg-[var(--color-footer)] rounded-md">
            <x-slot:sidebar>

                <div class="p-[16px]">
                    <div class="flex justify-between items-center my-[16px]">
                        <div class="font-custom-bold-upper text-xl">ფილტრი</div>
                        <div><x-button icon="phosphor-trash-simple" iconPosition="right" size="sm" variant="transparent">გასუფთავება</x-button> </div>
                    </div>


                    <div class="my-[16px]">
                        <x-input-range
                            :showInputs="true"
                            sliderClass="w-[94%] mt-[15px] mx-auto"
                            class="gap-[24px]"
                            minInputClass="flex-1 h-[40px] rounded-[12px] border-[1px] border-slate-300 text-center text-[16px] text-slate-600"
                            maxInputClass="flex-1 h-[40px] rounded-[12px] border-[1px] border-slate-300 text-center text-[16px] text-slate-600"
                            inputsWrapperClass="flex  gap-[8px]  mt-[36px] mx-auto"
                            label="ფასი"
                            labelClass="top-[18px] !left-[10px]"
                            showValueInLabelText="ლარი"
                            :showValueInLabel="true"
                            inputMobileStyle="block mt-[10px]"
                        />
                    </div>

                    <x-line class="!border-white" />

                    <div class="my-[16px] font-custom-regular">

                            <section class="my-[20px]">

                                <div class="font-custom-bold-upper my-[10px] text-sm">მდგომარეობა</div>

                                <div class="space-y-[10px] w-full">
                                    <div>
                                        <x-checkbox id="id_condition_1" name="condition[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="ახალი" />
                                    </div>
                                    <div>
                                        <x-checkbox id="id_condition_2" name="condition[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="მეორადი" />
                                    </div>
                                </div>
                            </section>


                            <section>
                                <div class="font-custom-bold-upper my-[10px] text-sm">ბრენდი</div>

                                <div class="my-[10px]">
                                    <x-input id="filter-search-brand" placeholder="ბრენდი" class="w-full !h-[45px]" />
                                </div>

                                <x-line class="!border-white" />

                                <div class="h-[300px]  overflow-y-scroll space-y-[10px]">
                                     @foreach($brands as $key => $brand)
                                        <div>
                                            <x-checkbox id="id_{{$key}}" name="models[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="{{ $brand }}" />
                                        </div>
                                    @endforeach
                                </div>
                            </section>


                            <section class="my-[20px]">
                                <x-line class="!border-white" />
                                <div class="font-custom-bold-upper my-[10px] text-sm">სისტემა</div>

                                <div class="space-y-[10px] w-full">
                                    <div>
                                        <x-checkbox id="id_system_1" name="system[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="IOS" />
                                    </div>

                                    <div>
                                        <x-checkbox id="id_system_2" name="system[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="Andrroid" />
                                    </div>
                                </div>
                            </section>


                            <section class="my-[20px]">
                                <x-line class="!border-white" />
                                <div class="font-custom-bold-upper my-[10px] text-sm">მეხსიერება</div>

                                <div class="space-y-[10px] w-full">
                                    <div>
                                        <x-checkbox id="id_int_memory_1" name="int_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="128" />
                                    </div>

                                    <div>
                                        <x-checkbox id="id_int_memory_2" name="int_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="256" />
                                    </div>
                                </div>
                            </section>

                            <section class="my-[20px]">
                                <x-line class="!border-white" />
                                <div class="font-custom-bold-upper my-[10px] text-sm">ოპერატიული მეხსიერება</div>

                                <div class="space-y-[10px] w-full">
                                    <div>
                                        <x-checkbox id="id_operation_memory_1" name="operation_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="2GB" />
                                    </div>

                                    <div>
                                        <x-checkbox id="id_operation_memory_2" name="operation_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="4GB" />
                                    </div>

                                    <div>
                                        <x-checkbox id="id_operation_memory_3" name="operation_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="6GB" />
                                    </div>
                                </div>
                            </section>

                    </div>




                </div>


            </x-slot:sidebar>
            <x-slot:content>
                <x-breadcrumbs />
                <div class="flex justify-between items-center my-[16px]">
                    <div class="flex flex-col">
                        <div class="font-custom-bold-upper text-xl">Apple</div>
                        <div class="font-custom-bold-upper text-xs text-gray-500">ნაპოვნია - 20 ჩანაწერი</div>
                    </div>
                    <div>
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
