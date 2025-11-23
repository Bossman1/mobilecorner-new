@props([
    'id' => 'id_'.uniqid(),
    'burgerSelector' => ''
])

<nav id="{{ $id }}"
     class="fixed left-0 top-[59px] h-full w-[82%] max-w-[320px]   shadow-2xl text-black
            -translate-x-full transition-transform duration-300 overflow-y-auto z-[60] font-custom-regular pb-[47px] bg-[var(--color-footer)]">
    <div class="p-4">
        {{ $slot }}
    </div>
</nav>

<div id="{{ $id }}-overlay"  class="fixed inset-0 bg-black/40 backdrop-blur-sm opacity-0 pointer-events-none transition-all duration-300 z-[59]"></div>


<script>
    $(function (){
        const $mBurger = $("#{{ $burgerSelector }}");
        const $mMenu   = $("#{{ $id }}");
        const $mOverlay = $("#{{ $id }}-overlay");

        // Open / Close mobile menu
        $mBurger.on("click", function () {
            $(this).toggleClass("open");
            $mMenu.toggleClass("-translate-x-full");
            $mOverlay.toggleClass("opacity-0 pointer-events-none");
        });

        $mOverlay.on("click", function () {
            $mBurger.removeClass("open");
            $mMenu.addClass("-translate-x-full");
            $mOverlay.addClass("opacity-0 pointer-events-none");
        });
    });
</script>
