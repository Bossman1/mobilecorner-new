<div class="flex justify-between items-center my-[16px]">
    <div class="font-custom-bold-upper text-xl">ფილტრი</div>
    <div><x-button icon="phosphor-trash-simple" iconPosition="right" size="sm" :options="['clear-filter']" variant="transparent">გასუფთავება</x-button> </div>
</div>


<div class="my-[16px]">
    <x-input-range
        :min="(int)$minPrice"
        :max="(int)$maxPrice"
        minInputName="price_min"
        maxInputName="price_max"
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
                <x-checkbox  name="condition[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none" value="new"  label="ახალი" />
            </div>
            <div>
                <x-checkbox  name="condition[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none" value="owned"  label="მეორადი" />
            </div>
        </div>
    </section>

    @php
        $brands = $attributeFilters->firstWhere('slug', 'brendi');
    @endphp
    @if($brands)
    <section>
        <div class="font-custom-bold-upper my-[10px] text-sm">ბრენდი</div>

        <div class="my-[10px]">
            <x-input id="filter-search-brand" name="filter-search-brand" placeholder="ბრენდი" class="w-full !h-[45px] filter-search-brand" />
        </div>

        <x-line class="!border-white" />

        <div class="min-h-[50px]  overflow-y-scroll space-y-[10px]">





            @foreach($brands->values as $key => $brand)
                <div>
                    <x-checkbox  name="attr[{{ $brands->slug }}][]" class="!text-[var(--color-main)] focus:!ring-0 !border-none" value="{{ $brand->id }}"  label="{{ $brand->value }}" />
                </div>
            @endforeach

        </div>
    </section>
    @endif

    @foreach($attributeFilters as $filter)
        @if($filter->slug === 'brendi')
            @continue
        @endif
        <section class="my-[20px]">
            <x-line class="!border-white" />

            <div
                class="flex items-center justify-between my-[10px] cursor-pointer js-filter-toggle"
                data-filter-id="{{ $filter->id }}"
            >
                <div class="font-custom-bold-upper text-sm">
                    {{ $filter->name }}
                </div>

                <x-dynamic-component :component="'phosphor-caret-down'" class="h-[15px] w-[15px] js-filter-icon transition-transform duration-200 rotate-180"/>
            </div>

            {{-- Content to fold/unfold --}}
            <div
                class="space-y-[10px] w-full js-filter-body  "
                data-filter-id="{{ $filter->id }}"
            >
                @foreach($filter->values as $value)

                    <div>
                        <x-checkbox
                            name="attr[{{ $filter->slug }}][]"
                            class="!text-[var(--color-main)] focus:!ring-0 !border-none"
                            value="{{ $value->id }}"
                            label="{{ $value->value }} {{ $filter->unit }}"
                        />
                    </div>
                @endforeach
            </div>
        </section>

    @endforeach




</div>


