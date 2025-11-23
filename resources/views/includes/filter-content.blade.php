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
                <x-checkbox  name="condition[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="ახალი" />
            </div>
            <div>
                <x-checkbox  name="condition[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="მეორადი" />
            </div>
        </div>
    </section>


    <section>
        <div class="font-custom-bold-upper my-[10px] text-sm">ბრენდი</div>

        <div class="my-[10px]">
            <x-input id="filter-search-brand" placeholder="ბრენდი" class="w-full !h-[45px] filter-search-brand" />
        </div>

        <x-line class="!border-white" />

        <div class="min-h-[50px]  overflow-y-scroll space-y-[10px]">
            @foreach($brands as $key => $brand)
                <div>
                    <x-checkbox  name="models[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="{{ $brand }}" />
                </div>
            @endforeach
        </div>
    </section>


    <section class="my-[20px]">
        <x-line class="!border-white" />
        <div class="font-custom-bold-upper my-[10px] text-sm">სისტემა</div>

        <div class="space-y-[10px] w-full">
            <div>
                <x-checkbox  name="system[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="IOS" />
            </div>

            <div>
                <x-checkbox   name="system[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="Andrroid" />
            </div>
        </div>
    </section>


    <section class="my-[20px]">
        <x-line class="!border-white" />
        <div class="font-custom-bold-upper my-[10px] text-sm">მეხსიერება</div>

        <div class="space-y-[10px] w-full">
            <div>
                <x-checkbox  name="int_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="128" />
            </div>

            <div>
                <x-checkbox  name="int_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="256" />
            </div>
        </div>
    </section>

    <section class="my-[20px]">
        <x-line class="!border-white" />
        <div class="font-custom-bold-upper my-[10px] text-sm">ოპერატიული მეხსიერება</div>

        <div class="space-y-[10px] w-full">
            <div>
                <x-checkbox  name="operation_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="2GB" />
            </div>

            <div>
                <x-checkbox   name="operation_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="4GB" />
            </div>

            <div>
                <x-checkbox  name="operation_memory[]" class="!text-[var(--color-main)] focus:!ring-0 !border-none"  label="6GB" />
            </div>
        </div>
    </section>

</div>


