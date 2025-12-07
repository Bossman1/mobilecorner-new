<x-button id="scrollTopBtn" size="sm" icon="phosphor-arrow-up" variant="outline"
          class="fixed bottom-6 right-6 z-[9999] w-10 h-10 xl:w-12 xl:h-12 rounded-full bg-[var(--color-main)]   flex items-center justify-center shadow-lg cursor-pointer opacity-0 invisible translate-y-4 transition-all duration-300 hover:bg-opacity-90 border-transparent"
          iconCustomClass="!mr-0" >
</x-button>





<script>
    document.addEventListener('DOMContentLoaded', function () {
        const scrollBtn = document.getElementById('scrollTopBtn');

        // Show when scrolling down
        window.addEventListener('scroll', function () {
            if (window.scrollY > 300) {
                scrollBtn.classList.remove('opacity-0', 'invisible', 'translate-y-4');
            } else {
                scrollBtn.classList.add('opacity-0', 'invisible', 'translate-y-4');
            }
        });

        // Scroll to top
        scrollBtn.addEventListener('click', function () {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    });
</script>
