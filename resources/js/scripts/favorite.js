$(function () {

    $(document).on("click", "[data-btn-favorites]", function (e) {
        e.preventDefault();

        let $this = $(this);
        let id = $this.data("id").toString();

        let $spinner = $this.find(".spinner");

        // show spinner
        $spinner.removeClass("hidden");

        setTimeout(() => {
            let favorites = JSON.parse(localStorage.getItem("favorites") || "[]");

            if (favorites.includes(id)) {
                favorites = favorites.filter(f => f !== id);
                // Remove class from all buttons with same ID
                $(`[data-btn-favorites][data-id='${id}']`).removeClass("is-fav").addClass("not-fav");
            } else {
                favorites.push(id);
                // Add class to all buttons with same ID
                $(`[data-btn-favorites][data-id='${id}']`).removeClass("not-fav").addClass("is-fav");
            }

            // Save updated favorites
            localStorage.setItem("favorites", JSON.stringify(favorites));

            // hide spinner for this button
            $spinner.addClass("hidden");

            // update count
            window.updateFavoritesCount();
        }, 300);
    });


    window.loadFavorites = function () {
        let favorites = JSON.parse(localStorage.getItem("favorites") || "[]");

        $("[data-btn-favorites]").each(function () {
            let $btn = $(this);
            let id = $btn.data("id").toString();

            if (favorites.includes(id)) {
                $(`[data-btn-favorites][data-id='${id}']`).removeClass('not-fav').addClass("is-fav");
            } else {
                $(`[data-btn-favorites][data-id='${id}']`).removeClass('is-fav').addClass("not-fav");
            }
        });
    }


    function getFavorites() {
        return JSON.parse(localStorage.getItem("favorites") || "[]");
    }

    function saveFavorites(list) {
        localStorage.setItem("favorites", JSON.stringify(list));
    }


    window.updateFavoritesCount = function () {
        let favorites = JSON.parse(localStorage.getItem("favorites") || "[]");
        let countWrapper = $('[data-fav-count]');

        // Count unique product IDs only
        let uniqueFavorites = [...new Set(favorites)];
        let countFavorites = uniqueFavorites.length;

        if (countFavorites > 0) {
            countWrapper.removeClass('hidden').text(countFavorites);
        } else {
            countWrapper.addClass('hidden');
        }
    }






    window.loadFavorites();
    window.updateFavoritesCount();

});
function loadFavoritesOnPage(page = 1) {
    const favorites = JSON.parse(localStorage.getItem("favorites") || "[]");

    $("#favorites-preloader").removeClass('hidden');

    $.ajax({
        url: '/get-content',
        type: 'POST',
        data: {
            action: 'getFavoriteContent',
            page: page,
            value: favorites,
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function (response) {

            if (response && response.success === true) {
                $('#favorite-wrapper').html(response.data.html);
                $('.pagination-wrapper').html(response.data.pagination);
                $("#favorites-preloader").addClass('hidden');
                window.loadFavorites();
            }

        }
    });

    return favorites;
}

window.loadFavoritesOnPage = loadFavoritesOnPage;



