@props(['items'])

<nav id="mMenu"
     class="fixed left-0 top-[59] h-full w-[82%] max-w-[320px] bg-white shadow-2xl text-black
            -translate-x-full transition-transform duration-300 overflow-y-auto z-[60] font-custom-regular pb-[47px]">
    <div class="p-4">
        <ul class="space-y-2">
            @foreach($items as $item)
                <x-mobile-menu-item :item="$item" />
            @endforeach
        </ul>
    </div>
</nav>

<div id="mOverlay"  class="fixed inset-0 bg-black/40 backdrop-blur-sm opacity-0 pointer-events-none transition-all duration-300 z-[59]"></div>

@once
    <script>
        $(function () {

            const $mBurger = $("#mBurger");
            const $mMenu   = $("#mMenu");
            const $mOverlay = $("#mOverlay");

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

            // Recursive function to get total height including open children
            function getTotalHeight($element) {
                let totalHeight = 0;

                $element.children().each(function () {
                    totalHeight += $(this).outerHeight();

                    const $submenu = $(this).find("> ul");

                    if ($submenu.length && $submenu[0].style.maxHeight && $submenu[0].style.maxHeight !== "0px") {
                        totalHeight += getTotalHeight($submenu);
                    }
                });

                return totalHeight + 20; // padding/margin compensation
            }

            // Update all parent UL heights
            function updateParentHeights($element) {
                let $parent = $element.parent().closest("ul");

                while ($parent.length && $parent.attr("id") !== "mMenu") {
                    if ($parent[0].style.maxHeight && $parent[0].style.maxHeight !== "0px") {
                        $parent[0].style.maxHeight = getTotalHeight($parent) + "px";
                    }
                    $parent = $parent.parent().closest("ul");
                }
            }

            // Accordion
            $("#mMenu button").on("click", function (e) {
                const $btn = $(this);
                const $menu = $btn.next("ul");
                if (!$menu.length) return;

                const $arrow = $btn.find('span[class*="Arrow"]');

                if ($menu[0].style.maxHeight && $menu[0].style.maxHeight !== "0px") {
                    // Close
                    $menu[0].style.maxHeight = "0px";
                    $arrow.css("transform", "");
                } else {
                    // Open
                    const totalHeight = getTotalHeight($menu);
                    $menu[0].style.maxHeight = totalHeight + "px";
                    $arrow.css("transform", "rotate(180deg)");
                }

                // Update parents
                setTimeout(() => updateParentHeights($menu), 20);

                e.stopPropagation();
            });

        });


    </script>
@endonce
