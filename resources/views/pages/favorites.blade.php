@extends('layouts.app')
@section('content')

    <div class="container mx-auto font-custom-regular">

        <div class="mt-[32px]">
            <x-breadcrumbs />
            <div class="flex justify-between items-center my-[16px]">
                <div class="flex flex-col">
                    <div class="font-custom-bold-upper text-xl">რჩეულები</div>
                </div>
            </div>

<div class="relative">
            <div id="favorite-wrapper" class="grid grid-cols-2 md:!grid-cols-3 xl:!grid-cols-4 gap-6"></div>
            <div id="favorites-preloader" class="absolute inset-0 flex items-center justify-center hidden">
                <div class="w-12 h-12 rounded-full animate-spin border-4 border-t-transparent border-b-[#7961b7] border-l-[#9f7aea] border-r-[#c4b5fd]"></div>
            </div>
</div>
            {{--pagination wrapper start--}}
            <div class="pagination-wrapper text-center my-[16px] md:my-[38px] md:h-[48px] md:py-[12px]"></div>
            {{--pagination wrapper end--}}
        </div>
    </div>
@endsection


@push('js')
    <script>

           $(function (){
               window.loadFavoritesOnPage();
           });

    </script>
@endpush
