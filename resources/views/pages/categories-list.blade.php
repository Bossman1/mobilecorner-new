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
                        <div class="font-custom-bold-upper text-xl">{{ isset($category) ? $category->name : $heading ?? ''  }}</div>
                        <div class="font-custom-bold-upper text-xs text-gray-500">ნაპოვნია - {{ $totalProducts }} ჩანაწერი</div>
                    </div>
                    <div class="flex justify-between items-center w-full xl:w-auto xl:!hidden">
                        <div class="flex justify-between items-center gap-2" id="filter-mobile-sort">
                            <x-dynamic-component :component="'phosphor-list'" class="h-[30px] w-[30px]"/>
                            <span class="leading-[16px]">ფილტრი</span>
                        </div>

                        <x-select class="w-full flex-1 !h-[50px] !pt-[14px] !text-sm" placeholder="სორტირტება" :options="$optionsFilter"/>
                    </div>
                </div>


                <div class="grid grid-cols-2 md:!grid-cols-3 gap-6">
                    @foreach($products as $product)
                        @php
                            $productImage = json_decode($product->images)[0] ??  '';
                            $options = [
                               'image' => Voyager::image($productImage),
                                'price' => $product->a_old_price,
                                'old_price' => $product->a_new_price,
                                'title' => $product->title,
                                'id' => $product->id,
                                'slug' => $product->slug,
                              ];
                            $condition = $product->condition;
                            $favorite = rand(0, 1) ? '!bg-white !text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)]' : '!bg-[var(--color-favorite)]';
                        @endphp
                        <x-card-product wrapper-class="!shadow-[0_0_15px_rgba(0,0,0,0.15)]" :condition="$condition" :favorite="$favorite" :options="$options"/>
                    @endforeach


                </div>

                {{--pagination wrapper start--}}
                    <div class="pagination-wrapper text-center my-[16px] md:my-[38px] md:h-[48px] md:py-[12px]">
                        {{ $products->links() }}
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
        $(document).ready(function() {
            const $searchInput = $(".filter-search-brand");
            const $checkboxes = $('[name="models[]"]');

            $searchInput.on("input", function() {
                // console.log(123123)
                const query = $(this).val().toLowerCase().trim();

                $checkboxes.each(function() {
                    const $input = $(this);

                    // outer wrapper div that wraps the checkbox component
                    let $outerWrapper = $input.closest('x-checkbox, div').parent() || $input.closest('div');

                    // find label inside the checkbox component
                    const $label = $input.closest("div").find("label").first();
                    const labelText = $label.length ? $label.text().toLowerCase().trim() : "";

                    if (labelText.includes(query)) {
                        $outerWrapper.show();
                    } else {
                        $outerWrapper.hide();
                    }
                });
            });
        });
    </script>


@endpush
