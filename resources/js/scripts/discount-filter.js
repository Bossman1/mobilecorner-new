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
                console.log(res.html)
                $('#product-wrapper')
                    .html(res.html)
                    .removeClass('opacity-50 pointer-events-none');

                $('.pagination-wrapper').html(res.pagination);

                if (typeof res.total !== 'undefined') {
                    $('.js-total-products').text(res.total);
                }

                // We DO NOT change URL params -> filters stay hidden.
                // If you want, you can still update history with just /discounts
                // window.history.replaceState({}, '', "{{ route('products.discounted') }}");
            },
            error: function () {
                $('#product-wrapper').removeClass('opacity-50 pointer-events-none');
            }
        });
    }

    /**
     * Pagination buttons call this.
     * We keep your function name for compatibility.
     */
    function loadFavoritesOnPage(page) {
        fetchDiscountProducts(page);
    }
    window.loadFavoritesOnPage = loadFavoritesOnPage; // make sure it's global

    // Trigger filtering on change
    $(document).on('change', '.js-filters-form input, .js-filters-form select', function () {
        // Always go back to first page when filter changes
        fetchDiscountProducts(1);
    });

    // Optional: Enter in text inputs triggers filter
    $(document).on('keyup', '.js-filters-form input[type="text"]', function (e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            fetchDiscountProducts(1);
        }
    });

    // Optional: clear button (if you want to wire "გასუფთავება")
    $(document).on('click', '.js-clear-filters', function (e) {
        e.preventDefault();
        const form = $('.js-filters-form').first()[0];
        form.reset();
        fetchDiscountProducts(1);
    });

});
