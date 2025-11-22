$(function (){

    const mBurger = document.getElementById("mBurger");
    const mMenu = document.getElementById("mMenu");
    const mOverlay = document.getElementById("mOverlay");

    // Open/Close menu
    mBurger.addEventListener("click", () => {
        mBurger.classList.toggle("open");
        mMenu.classList.toggle("-translate-x-full");
        mOverlay.classList.toggle("opacity-0");
        mOverlay.classList.toggle("pointer-events-none");
    });

    // Close on overlay click
    mOverlay.addEventListener("click", () => {
        mBurger.classList.remove("open");
        mMenu.classList.add("-translate-x-full");
        mOverlay.classList.add("opacity-0", "pointer-events-none");
    });

    // Accordion (first-level)
    document.querySelectorAll(".mParent").forEach(btn => {
        btn.addEventListener("click", () => {
            const menu = btn.nextElementSibling;
            const arrow = btn.querySelector(".mArrow");

            menu.style.maxHeight = menu.style.maxHeight && menu.style.maxHeight !== "0px"
                ? "0px"
                : menu.scrollHeight + "px";

            arrow.style.transform = arrow.style.transform ? "" : "rotate(180deg)";
        });
    });

    // Accordion (second-level)
    document.querySelectorAll(".mSubParent").forEach(btn => {
        btn.addEventListener("click", () => {
            const menu = btn.nextElementSibling;
            const arrow = btn.querySelector(".mSubArrow");

            menu.style.maxHeight = menu.style.maxHeight && menu.style.maxHeight !== "0px"
                ? "0px"
                : menu.scrollHeight + "px";

            arrow.style.transform = arrow.style.transform ? "" : "rotate(180deg)";
        });
    });


});
