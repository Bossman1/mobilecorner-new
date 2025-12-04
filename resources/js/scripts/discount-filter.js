$(function (){

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    /**
     * Core AJAX fetch function (POST).
     * page = optional page number.
     */
    function fetchDiscountProducts(page) {
        const url = "/discounts/filter";

        // Get form data (filters)
        const form = $('.js-filters-form').first();
        let data = form.serializeArray();

        // Add page manually (for paginator)
        if (page) {
            data.push({ name: 'page', value: page });
        }

        $.ajax({
            url: url,
            type: 'POST',
            data: $.param(data),
            beforeSend: function () {
                $('#product-wrapper').addClass('opacity-50 pointer-events-none');
            },
            success: function (res) {
                // console.log(res.html)
                $('#product-wrapper')
                    .html(res.html)
                    .removeClass('opacity-50 pointer-events-none');

                $('.pagination-wrapper').html(res.pagination);

                if (typeof res.total !== 'undefined') {
                    $('.js-total-products').text(res.total);
                }

            },
            error: function () {
                $('#product-wrapper').removeClass('opacity-50 pointer-events-none');
            }
        });
    }


    // Trigger filtering on change
    $(document).on(
        'change',
        '.js-filters-form input:not([name="filter-search-brand"]), .js-filters-form select',
        function () {
            fetchDiscountProducts(1);
        }
    );





    $(".js-filters-form [id^='range-']").each(function () {
        let slider = this;
        if (!slider.noUiSlider) return;
        slider.noUiSlider.on('change', function(values){
            fetchDiscountProducts(1);
        });
    });


    $(document).on('click', '.js-filters-form [clear-filter]', function (e) {
        e.preventDefault();

        let $form = $(this).closest('form');

        // 1) RESET TEXT INPUTS
        $form.find('input[type="text"], input[type="number"]').val('');

        // 2) RESET CHECKBOXES
        $form.find('input[type="checkbox"]').prop('checked', false);

        // 3) RESET SLIDERS
        $form.find("[id^='range-']").each(function () {

            let slider = this;
            if (!slider.noUiSlider) return;

            // find the related inputs
            let id = slider.id.replace("range-", "");

            let $minInput = $("#min-input-" + id);
            let $maxInput = $("#max-input-" + id);

            // read original min/max from HTML attributes
            let min = parseFloat($minInput.attr("min"));
            let max = parseFloat($maxInput.attr("max"));

            // reset slider to default values
            slider.noUiSlider.set([min, max]);

            // update inputs as well
            $minInput.val(min);
            $maxInput.val(max);
            fetchDiscountProducts(1);
        });

    });







});
