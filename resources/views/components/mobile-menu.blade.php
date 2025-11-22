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
            const mBurger = document.getElementById("mBurger");
            const mMenu = document.getElementById("mMenu");
            const mOverlay = document.getElementById("mOverlay");

            // Open/Close mobile menu
            mBurger.addEventListener("click", () => {
                mBurger.classList.toggle("open");
                mMenu.classList.toggle("-translate-x-full");
                mOverlay.classList.toggle("opacity-0");
                mOverlay.classList.toggle("pointer-events-none");
            });

            mOverlay.addEventListener("click", () => {
                mBurger.classList.remove("open");
                mMenu.classList.add("-translate-x-full");
                mOverlay.classList.add("opacity-0", "pointer-events-none");
            });

            // Helper function to get total height including all open children (works for unlimited nesting)
            function getTotalHeight(element) {
                let totalHeight = 0;

                // Get direct children height
                Array.from(element.children).forEach(child => {
                    totalHeight += child.offsetHeight;

                    // If child has an open submenu, recursively add its height
                    // This works for any nesting level: sub -> sub-sub -> sub-sub-sub -> etc.
                    const submenu = child.querySelector('ul');
                    if (submenu && submenu.style.maxHeight && submenu.style.maxHeight !== "0px") {
                        totalHeight += getTotalHeight(submenu); // Recursive call handles infinite depth
                    }
                });

                // Add offset for padding, margins, and spacing (adjust as needed)
                const offset = 20;
                return totalHeight + offset;
            }

            // Helper function to update all parent max-heights
            function updateParentHeights(element) {
                let parent = element.parentElement?.closest('ul');

                while (parent && parent.id !== 'mMenu') {
                    if (parent.style.maxHeight && parent.style.maxHeight !== "0px") {
                        const newHeight = getTotalHeight(parent);
                        parent.style.maxHeight = newHeight + "px";
                    }
                    parent = parent.parentElement?.closest('ul');
                }
            }

            // Accordion
            document.querySelectorAll("#mMenu button").forEach(btn => {
                btn.addEventListener("click", (e) => {
                    const menu = btn.nextElementSibling;
                    if (!menu || menu.tagName !== "UL") return;

                    const arrow = btn.querySelector('span[class*="Arrow"]');

                    if (menu.style.maxHeight && menu.style.maxHeight !== "0px") {
                        // Closing
                        menu.style.maxHeight = "0px";
                        if (arrow) arrow.style.transform = "";
                    } else {
                        // Opening
                        const totalHeight = getTotalHeight(menu);
                        menu.style.maxHeight = totalHeight + "px";
                        if (arrow) arrow.style.transform = "rotate(180deg)";
                    }

                    // Update all parent heights to accommodate the change
                    setTimeout(() => updateParentHeights(menu), 20);

                    e.stopPropagation();
                });
            });
        });

    </script>
@endonce
