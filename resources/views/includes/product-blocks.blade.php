{{--product blocks start--}}
<div>
    <div class="flex justify-between items-center">
        <h2 class="text-[17px] font-custom-bold-upper my-[20px]">
            <a href="{{ route('pages.categories-list') }}">კატეგორიის სახელი</a>
        </h2>
        <a href="{{ route('pages.categories-list') }}">
            <div class="flex justify-between items-center gap-1 group hover:text-[var(--color-main)] font-custom-regular">
                <span class="text-sm">ყველას ნახვა</span>
                <x-dynamic-component :component="'phosphor-arrow-square-out'" class="h-5 w-5 group-hover:text-[var(--color-main)]"/>
            </div>
        </a>
    </div>


    <div>
        <x-carousel  :pagination="false" perPage="6" perPageMobile="2" perPageTablet="3">
            @for($i = 0; $i < 24; $i++)
                @php
                    $options = [
                            'image' => asset('assets/images/temp/img1.webp'),
                            'price' => rand(100,200),
                            'title' =>'Apple iPhone Air e-SIM | 256GB Sky Blue-'.rand(34,34565),
                      ];
                $condition = rand(0, 1) ? 'new' : 'owned';
                $favorite = rand(0, 1) ? '!bg-white !text-slate-500 hover:!text-white hover:!bg-[var(--color-favorite)]' : '!bg-[var(--color-favorite)]';
                @endphp
                <x-card-product :condition="$condition" :favorite="$favorite" :options="$options"/>
            @endfor
        </x-carousel>
    </div>


    {{--category ads block start--}}

    @php
        $bannerOptions = [
            ['img' => asset('assets/images/temp/banner5.jpeg'), 'url' => 'https://google.ge'],
            ['img' => asset('assets/images/temp/banner5.jpeg'), 'url' => 'https://google.ge'],
            ['img' => asset('assets/images/temp/banner5.jpeg'), 'url' => 'https://google.ge'],
            ['img' => asset('assets/images/temp/banner5.jpeg'), 'url' => 'https://google.ge'],
        ];
    @endphp

    <x-products-ads-block :options="$bannerOptions" bg-color="bg-purple-300" />
    {{--category ads block end--}}
</div>
{{--product blocks end--}}
