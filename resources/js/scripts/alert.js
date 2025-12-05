import Swal from 'sweetalert2';
import 'sweetalert2/themes/material-ui.css';


export function showModal({
                              title = '',
                              text = '',
                              icon = null,
                              theme = 'material-ui'
                          }) {

    const icons = {
        success: `
        <div class="swal2-icon swal2-success swal2-icon-show swal2-animate-success-icon">
            <div class="swal2-success-circular-line-left"></div>
            <span class="swal2-success-line-tip"></span>
            <span class="swal2-success-line-long"></span>
            <div class="swal2-success-ring"></div>
            <div class="swal2-success-fix"></div>
            <div class="swal2-success-circular-line-right"></div>
        </div>
    `,
        error: `
        <div class="swal2-icon swal2-error swal2-icon-show swal2-animate-error-icon">
            <span class="swal2-x-mark">
                <span class="swal2-x-mark-line-left"></span>
                <span class="swal2-x-mark-line-right"></span>
            </span>
        </div>
    `,
        warning: `
        <div class="swal2-icon swal2-warning swal2-icon-show swal2-animate-warning-icon">
            <div class="swal2-icon-content block !flex-none">!</div>
        </div>
    `,
        info: `
        <div class="swal2-icon swal2-info swal2-icon-show swal2-animate-info-icon">
            <div class="swal2-icon-content">i</div>
        </div>
    `,
        question: `
        <div class="swal2-icon swal2-question swal2-icon-show swal2-animate-question-icon">
            <div class="swal2-icon-content">?</div>
        </div>
    `
    };


    Swal.fire({
        title: '', // we inject custom title in HTML
        html: `
            <div class="flex justify-between items-center w-full mb-3 font-custom-regular">
                <h2 class="text-lg font-semibold tracking-wide text-gray-700 font-custom-bold-upper w-full">
                    ${title}
                </h2>
                <button id="swal-close-btn"
                    class="text-gray-400 hover:text-gray-600 text-xl leading-none transition-all"
                    style="background:none; border:none; cursor:pointer;">
                    &times;
                </button>
            </div>

            ${icon ? `<div class="">${icons[icon]}</div>` : ''}

            <div class="text-gray-600 text-[15px] leading-relaxed font-custom-regular">
                ${text}
            </div>
        `,

        showConfirmButton: false,
        allowOutsideClick: false,
        allowEscapeKey: true,

        backdrop: `
            rgba(255, 255, 255, 0.5)
            backdrop-filter: blur(4px)
        `,

        customClass: {
            popup: `
                p-5
                rounded-2xl
                bg-white/90
                shadow-[0_8px_24px_rgba(0,0,0,0.1)]
                border border-gray-200
                animate__animated
                animate__fadeInDown
            `
        },

        didOpen: () => {
            const popup = Swal.getPopup();
            popup.style.opacity = '0';
            popup.style.transform = 'translateY(-8px)';
            setTimeout(() => {
                popup.style.transition = 'all 0.25s ease';
                popup.style.opacity = '1';
                popup.style.transform = 'translateY(0)';
            }, 20);
        }
    });

    // Close button handler
    document.addEventListener('click', function handler(e) {
        if (e.target && e.target.id === 'swal-close-btn') {
            Swal.close();
            document.removeEventListener('click', handler);
        }
    });
}
