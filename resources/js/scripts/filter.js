$(function (){



    const $searchInput = $(".filter-search-brand");
    const $checkboxes = $('[name="models[]"]');

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
