$(function () {


    // show /hide mini cart - start
    let $miniCart = $('#mini-cart');
    // Hover to show mini-cart
    $('#cart-container').hover(
        function () {
            $miniCart.removeClass('opacity-0 invisible').addClass('opacity-100');
        },
        function () {
            $miniCart.removeClass('opacity-100').addClass('opacity-0');
            setTimeout(function () {
                if ($miniCart.hasClass('opacity-0')) $miniCart.addClass('invisible');
            }, 300);
        }
    );
    // show /hide mini cart - end



    // Add to cart - star
    $(".add-to-cart-btn").on("click", function () {
        let $btn = $(this);
        let imgUrl = $btn.data("image");
        let title = $btn.data("title");
        let price = $btn.data("product-price");

        // Add item via AJAX first
        $.ajax({
            url: "/cart/add-to-cart",
            type: "POST",
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                image: imgUrl,
                title: title,
                price: price
            },
            success: function (response) {
                if (response.success) {
                    // Hide placeholder if any
                    $("#cart-placeholder").hide();

                    // Append item HTML
                    $("#mini-cart-items").append(response.html);

                    // Update counter
                    let count = $("#mini-cart-items  .cart-item").length;

                    $("#cart-count, .product-count").text(count).removeClass("invisible opacity-0").addClass("opacity-100");

                    // Attach remove button event
                    $("#cart-item-" + response.id + " .remove-cart-item").on("click", function () {
                        $(this).closest("div[id^='cart-item-']").remove();
                        let newCount = $("#mini-cart-items .cart-item").length;
                        if (newCount === 0) {
                            $("#cart-placeholder").show();
                            $("#cart-count").addClass("invisible opacity-0");
                            $(".product-count").text(0);
                        } else {
                            $("#cart-count, .product-count").text(newCount);
                        }
                    });

                    // === Start flying image animation AFTER AJAX success ===
                    let imgToDrag = $('<img />', {
                        src: imgUrl,
                        class: 'flying-img',
                        css: {
                            position: 'absolute',
                            zIndex: 9999,
                            width: '120px',
                            height: '120px',
                            borderRadius: '8px'
                        }
                    });
                    $("body").append(imgToDrag);

                    let btnOffset = $btn.offset();
                    let cartOffset = $("#cart-btn").offset();

                    imgToDrag.css({ top: btnOffset.top, left: btnOffset.left });

                    imgToDrag.animate({
                        top: cartOffset.top,
                        left: cartOffset.left,
                        width: 0,
                        height: 0,
                        opacity: 0.1
                    }, 1000, "easeInOutExpo", function () {
                        $(this).remove();
                    });
                }
            }
        });
    });
    // Add to cart - end

});
