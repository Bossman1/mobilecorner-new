<div id="inline-gallery-container2" class="inline-gallery-container"></div>

@once
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const lgContainer = document.getElementById('inline-gallery-container2');

            const images = [
                {
                    src: '{{ asset('assets/images/temp/img1.webp') }}',
                    thumb: '{{ asset('assets/images/temp/img1.webp') }}',
                    subHtml: `<div class="lightGallery-captions"><h4>Caption 1</h4><p>Description 1</p></div>`,
                },
                {
                    src: '{{ asset('assets/images/temp/img1.webp') }}',
                    thumb: '{{ asset('assets/images/temp/img1.webp') }}',
                    subHtml: `<div class="lightGallery-captions"><h4>Caption 2</h4><p>Description 2</p></div>`,
                },
            ];

            // Initialize dynamic gallery
            const inlineGallery = window.lightGallery(lgContainer, {
                container: lgContainer,
                dynamic: true,
                hash: false,
                closable: false,
                showMaximizeIcon: false,
                appendSubHtmlTo: '.lg-item',
                slideDelay: 400,
                plugins: [lgZoom, lgThumbnail, lgFullscreen],
                zoom: true,
                fullscreen: true,
                thumbWidth: 60,
                thumbHeight: 40,
                thumbMargin: 4,
                dynamicEl: images,
            });

            // Open the gallery immediately
            inlineGallery.openGallery();

            // Add click-to-toggle zoom on the current image
            document.addEventListener('click', (e) => {
                const zoomPlugin = inlineGallery.plugins.lgZoom;
                if (!zoomPlugin) return;

                const currentImage = document.querySelector('.lg-current img');
                if (!currentImage) return;

                // Only trigger zoom if the click is on the main image
                if (e.target === currentImage) {
                    zoomPlugin.toggleZoom(currentImage);
                }
            });
        });
    </script>
@endonce

<style>
    .inline-gallery-container {
        width: 100%;
        height: 0;
        padding-bottom: 65%;
    }
</style>
