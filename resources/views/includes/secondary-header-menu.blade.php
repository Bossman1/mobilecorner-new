<div class="relative group flex items-center h-full mr-4 font-custom-regular">
    <!-- Navigation Button -->
    <x-button
        :options="['data-secondary-menu-btn']"
        size="md" icon="phosphor-dots-nine" iconPosition="left" variant="primary"
              class="text-[18px] group-hover:bg-[var(--color-main-hover)] transition-colors"
              href="/">ნავიგაცია
    </x-button>

    <!-- Dropdown Content -->
    <div class="absolute top-full left-0  min-w-[900px]  h-[400px] bg-white text-black shadow-xl rounded-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-y-2 group-hover:translate-y-0 z-50 overflow-hidden hidden"
    data-menu-content
    >
        <div class="flex h-full">
            <!-- Left Navigation -->
            <div class="min-w-[280px] border-r border-slate-200 p-4 bg-white">
                <ul class="space-y-2">
                    @if(isset($menuCategories))
                        @foreach($menuCategories as $index => $category)
                            <li
                                class="cursor-pointer px-3 py-2 rounded-lg text-[15px] hover:bg-[var(--color-main)] hover:text-white transition"
                                data-menu="{{ $index }}">
                                {{ $category->name }}
                            </li>
                        @endforeach
                    @endif
                </ul>
            </div>

            <!-- Right Content (shared area) -->
            <div class="flex-1 p-6 bg-slate-50 rounded-r-2xl relative overflow-y-scroll">
                @if(isset($menuCategories))
                @foreach($menuCategories as $index => $category)
                    <div class="menu-content absolute inset-0 opacity-0 invisible hidden transition-all duration-300" data-content="{{ $index }}">

                        <div class="grid grid-cols-3 gap-3 p-[15px]">
                            <div class="col-span-3"> <x-line :text="$category->name"  /> </div>
                            @foreach($category->children as $child)
                                <a href="">
                                    <div
                                        class="relative border border-slate-200 rounded-xl hover:shadow-md transition p-2 flex flex-col items-center text-center bg-white w-[183px] h-[183px] overflow-hidden">
                                        <img src="{{ Voyager::image($child->getThumbnail($child->images, 'small')) }}" alt="product"
                                             class="rounded-md object-cover">
                                        <h4 class="text-[14px] font-custom-bold-upper text-slate-700 absolute bottom-[5px] text-center">{{ $child->name }}</h4>
                                    </div>
                                </a>
                            @endforeach
                        </div>



                    </div>
                @endforeach
                @endif
                <!-- Default Placeholder -->
                <div
                    class="menu-content-default absolute inset-0 flex flex-col justify-center items-center text-slate-500 transition-all duration-300">
                    <x-dynamic-component :component="'phosphor-dots-nine'" class="h-[50px] w-[50px] mb-2 text-slate-400"/>
                    <p class="text-[15px] text-center">აირჩიეთ კატეგორია</p>
                </div>
            </div>
        </div>
    </div>
</div>

@once
    @push('js')
        <script>
            $(document).ready(function() {
                const $menuItems = $('[data-menu]');
                const $contents = $('[data-content]');
                const $menuContent = $('[data-menu-content]');
                const $secondaryMenuBtn = $('[data-secondary-menu-btn]');
                const $defaultContent = $('.menu-content-default');
                const $leftMenu = $('.w-[280px]');
                const $dropdown = $leftMenu.closest('.absolute'); // main dropdown container

                $menuItems.on('mouseenter', function() {
                    const index = $(this).data('menu');

                    // Hide all content
                    $contents
                        .removeClass('opacity-100 visible hidden')
                        .addClass('opacity-0 invisible');

                    // Show selected content
                    const $active = $(`[data-content="${index}"]`);
                    if ($active.length) {
                        $defaultContent.addClass('opacity-0 invisible');
                        $active
                            .removeClass('opacity-0 invisible')
                            .addClass('opacity-100 visible');
                    }

                    // Ensure pointer events active
                    $dropdown.removeClass('pointer-events-none');
                });

                // Reset when leaving left menu
                $leftMenu.on('mouseleave', function() {
                    $contents
                        .removeClass('opacity-100 visible')
                        .addClass('opacity-0 invisible hidden');

                    $defaultContent.removeClass('opacity-0 invisible');

                    // Disable hover interaction completely
                    $dropdown.addClass('pointer-events-none');

                    // Re-enable after small delay (to allow re-hover)
                    setTimeout(() => {
                        $dropdown.removeClass('pointer-events-none');
                    }, 300);

                    console.log('out');
                });



                $secondaryMenuBtn.on('mouseenter', function() {

                    $menuContent .removeClass('hidden');
                    console.log('mouse enter');
                });

                $menuContent.on('mouseleave', function() {
                    $menuContent .addClass('hidden');
                    console.log('mouse leave');
                });

            });
        </script>

    @endpush
@endonce
