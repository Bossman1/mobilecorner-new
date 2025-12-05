$(document).ready(function () {

    let $input = $("[search-input-desktop]");
    let $inputMobile = $("[search-input-mobile]");
    let $resultsMobile = $("[search-result-mobile]");
    let $results = $("[search-result-desktop]");
    let $loader = $("[search-loader]");
    let typingTimer = null;

    $input.on("keyup", function () {
        clearTimeout(typingTimer);

        const query = $(this).val().trim();

        if (query.length < 2) {
            $results.addClass('hidden').html('');
            $loader.addClass('hidden');
            return;
        }

        typingTimer = setTimeout(() => {
            fetchSearch(query);
        }, 250);
    });

    $inputMobile.on("keyup", function () {
        clearTimeout(typingTimer);

        const query = $(this).val().trim();

        if (query.length < 2) {
            $resultsMobile.addClass('hidden').html('');
            $loader.addClass('hidden');
            return;
        }

        typingTimer = setTimeout(() => {
            fetchSearchMobile(query);
        }, 250);
    });


    function fetchSearch(query) {
        // Show loader
        $results.addClass('hidden');
        $loader.removeClass('hidden');

        $.ajax({
            url: "/get-content",
            method: "POST",
            data: {
                action: 'search',
                q: query,
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            success: function (data) {
                $loader.addClass('hidden');

                if (!data.html.trim()) {
                    $results.addClass('hidden').html('');
                } else {
                    $results.removeClass('hidden').html(data.html);
                }
            },
            error: function () {
                $loader.addClass('hidden');
                $results.addClass('hidden').html('');
            }
        });
    }

    function fetchSearchMobile(query) {
        // Show loader
        $resultsMobile.addClass('hidden');
        $loader.removeClass('hidden');

        $.ajax({
            url: "/get-content",
            method: "POST",
            data: {
                action: 'searchMobile',
                q: query,
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            success: function (data) {
                $loader.addClass('hidden');

                if (!data.html.trim()) {
                    $resultsMobile.addClass('hidden').html('');
                } else {
                    $resultsMobile.removeClass('hidden').html(data.html);
                }
            },
            error: function () {
                $loader.addClass('hidden');
                $resultsMobile.addClass('hidden').html('');
            }
        });
    }


    // Hide dropdown when clicking outside
    $(document).on("click", function (e) {
        if (!$(e.target).closest('[search-input-desktop], [search-result-desktop]').length) {
            $results.addClass('hidden');
            $loader.addClass('hidden');
        }
    });

});
