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





    const $searchInput = $(".filter-search-brand");
    const $checkboxes = $searchInput.closest('section').find('input[type=checkbox]');

    $searchInput.on("input", function() {
        const query = $(this).val().toLowerCase().trim();
        $checkboxes.each(function() {
            const $input = $(this);

            // outer wrapper div that wraps the checkbox component
            let $outerWrapper = $input.closest('x-checkbox, div').parent() || $input.closest('div');

            // find label inside the checkbox component
            const $label = $input.closest("div").find("label").first();
            const labelText = $label.length ? $label.text().toLowerCase().trim() : "";

            if (labelText.includes(query)) {
                $outerWrapper.show();
            } else {
                $outerWrapper.hide();
            }
        });
    });



    $(document).on('click', '.js-filter-toggle', function () {
        const filterId = $(this).data('filter-id');

        const $body = $('.js-filter-body[data-filter-id="' + filterId + '"]');
        const $icon = $(this).find('.js-filter-icon');

        if ($body.is(':visible')) {
            $body.stop(true, true).slideUp(150, function () {
                $body.addClass('hidden');
            });
        } else {
            $body.removeClass('hidden').hide(); // remove hidden, keep display:none for slideDown
            $body.stop(true, true).slideDown(150);
        }

        $icon.toggleClass('rotate-180');
    });



});
