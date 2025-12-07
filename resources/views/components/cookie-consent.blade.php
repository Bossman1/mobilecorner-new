@if(!request()->cookie('cookie_agreed'))
    <div id="cookie-popup"
         class="fixed bottom-4 inset-x-0 mx-auto max-w-xl bg-white text-gray-800 shadow-xl rounded-2xl p-5 z-[9999] border border-gray-200 opacity-0 translate-y-10 transition-all duration-300 font-custom-regular">
        <div class="flex flex-col space-y-3">
            <div class="font-custom-bold-upper">Cookie პოლიტიკა</div>
            <p class="text-sm leading-5">
                საიტით სარგებლობის გაგრძელებით, შენ ეთანხმები Cookie ჩანაწერების გამოყენებას. მეტი ინფორმაცისათვის იხილეთ
                <a href="https://mobilecorner.alertme.top/pages/page/tsesebi-da-pirobebi" class="font-custom-bold-upper">კონფიდენციალურობის პოლიტიკა</a>
            </p>

            <x-button id="cookie-agree-btn" size="md" class="w-full" variant="primary">გასაგებია</x-button>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const popup = document.getElementById('cookie-popup');

            if (localStorage.getItem('cookie_agreed') !== 'yes') {
                // Show popup with animation
                setTimeout(() => {
                    popup.classList.remove('opacity-0', 'translate-y-10');
                }, 100);
            }

            document.getElementById('cookie-agree-btn').addEventListener('click', function () {
                localStorage.setItem('cookie_agreed', 'yes');
                popup.classList.add('opacity-0', 'translate-y-10');
                setTimeout(() => popup.remove(), 300);
            });
        });
    </script>
@endif
