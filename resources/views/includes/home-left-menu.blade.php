<div class="w-full xl:!w-[246px] relative hidden xl:block">
    <div class="bg-white rounded-2xl shadow-md py-4">
        <ul class="divide-y divide-slate-200 [--tw-divide-opacity:1] [--tw-divide-width:90%]">




            @foreach($menuCategories as $category)
                <x-menu-category :category="$category" />
            @endforeach



        </ul>
    </div>
</div>
