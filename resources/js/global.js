$(function () {
    const $sidebar = $('.sidebar-content-class');
    const offsetTop = 100; // how far to scroll before sticking
    const hideAfter = 58;
    $(window).on('scroll load', function () {
        const scrollTop = $(this).scrollTop();
        if (scrollTop > offsetTop) {
            $sidebar.addClass('sticky top-[80px] shadow-lg');
        } else if (scrollTop < hideAfter) {
            $sidebar.removeClass('sticky top-0 shadow-lg');
        }
    });



    window.applyRadioUI =  function applyRadioUI($radio) {
        const name = $radio.attr('name');

        $(`input[name="${name}"][data-radio-input]`).each(function () {
            let $label = $(this).closest('[data-radio-label]');
            $label.removeClass('bg-[var(--color-main)] text-white')
                .addClass('bg-white text-slate-800');

            $label.find('[data-label-text]')
                .removeClass('text-white')
                .addClass('text-slate-800');
        });

        let $label = $radio.closest('[data-radio-label]');
        $label.removeClass('bg-white text-slate-800')
            .addClass('bg-[var(--color-main)] text-white');

        $label.find('[data-label-text]')
            .removeClass('text-slate-800')
            .addClass('text-white');
    }



});
