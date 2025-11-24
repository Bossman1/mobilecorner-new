$(function () {
    let $totalCartPrice = 0;

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

    function changePriceInCartBtn(price) {
        let $cartBrnSpan = $("#cart-btn span");
        if (price > 0) {
            $cartBrnSpan
                .contents()
                .filter(function () {
                    return this.nodeType === 3; // select only text
                })
                .first()
                .replaceWith(price + ' ₾');
            $(".basket-price-sum").text(price + ' ₾')
        } else {
            $cartBrnSpan
                .contents()
                .filter(function () {
                    return this.nodeType === 3; // select only text
                })
                .first()
                .replaceWith('კალათა');
            $(".basket-price-sum").text('0 ₾')
        }
        $totalCartPrice = price;
    }


    // Add to cart - star
    $(document).on("click", ".add-to-cart-btn", function (e) {
        e.preventDefault();
        let $btn = $(this);
        let imgUrl = $btn.data("image");
        let title = $btn.data("title");
        let price = $btn.data("product-price");
        let id = $btn.data("product-id");


        let check = isCartItemExists(id);
        if (check) {

            showModal({
                title: "შეტყობინება",
                text: "პროდუქტი უკვე დამატებულია კალათაში!"
            });
            return false;
        }
        ;
        // Add item via AJAX first
        $.ajax({
            url: "/cart/add-to-cart",
            type: "POST",
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                image: imgUrl,
                title: title,
                price: price,
                id: id
            },
            success: function (response) {
                if (response.success) {
                    $totalCartPrice += parseFloat(response.price);
                    // console.log(totalCartPrice);


                    // saveCartQuantity(response.id, 1);
                    saveCartItem(response.id, response.title, response.price, response.image, 1);

                    // Hide placeholder if any
                    $("#cart-placeholder").hide();

                    // Append item HTML
                    $("#mini-cart-items").append(response.html);

                    // Update counter
                    let count = $("#mini-cart-items  .cart-item").length;
                    updateCartItemCount();
                    window.renderCart();
                    // update cart btn text with price
                    changePriceInCartBtn(calculateCartTotals());

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

                    imgToDrag.css({top: btnOffset.top, left: btnOffset.left});

                    imgToDrag.animate({
                        top: cartOffset.top,
                        left: cartOffset.left + 100,
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

    // Attach remove button event
    $(document).on("click", ".remove-cart-item", function () {
        let $wrapper = $(this).closest(".cart-item");
        let $id = $wrapper.find(".quantity").data("id");


        // Remove from DOM
        $wrapper.remove();

        // Remove from localStorage
        removeCartItem($id);
        window.renderCart();

        // Recalculate cart count
        let newCount = $("#mini-cart-items .cart-item").length;
        $(".product-count").text(newCount);
        $("#cart-count, #m-cart-count").toggleClass("invisible opacity-0", newCount === 0);

        // Show/hide placeholder
        if (newCount === 0) {
            $("#cart-placeholder").show();
        } else {
            $("#cart-placeholder").hide();
        }

        // Recalculate total price
        let newTotalPrice = 0;
        $('.cart-item').each(function () {
            let qty = parseInt($(this).find(".quantity").text());
            let price = parseFloat($(this).find('.flex-1 > div:nth-child(2)').text().replace(/[^\d\.]/g, ''));
            newTotalPrice += price * qty;
        });
        console.log(newTotalPrice);
        changePriceInCartBtn(calculateCartTotals());
        updateCartItemCount();
    });


    $(document).on("click", ".cart-item-plus, .cart-item-minus", function () {

        let wrapper = $(this).closest(".cart-item");
        let qtyBox = wrapper.find(".quantity");
        let id = qtyBox.data("id");

        let qty = parseInt(qtyBox.text());

        // Increase or decrease quantity
        if ($(this).hasClass("cart-item-plus")) {
            qty++;
        } else {
            if (qty > 1) qty--;
        }

        qtyBox.text(qty);

        // Save new quantity
        saveCartQuantity(id, qty);

        // ---- REBUILD TOTAL PRICE ----
        let newCartTotal = 0;

        $(".cart-item").each(function () {
            let itemQty = parseInt($(this).find(".quantity").text());

            // extract price
            let price = $(this)
                .find('.flex-1 > div:nth-child(2)')
                .text()
                .replace(/[^\d\.]/g, '');

            let itemSubtotal = parseFloat(price) * itemQty;

            newCartTotal += itemSubtotal;
        });
        console.log(calculateCartTotals());
        // Update cart UI price
        changePriceInCartBtn(calculateCartTotals());
        updateCartItemCount();
        window.renderCart();
    });


    function saveCartQuantity(id, qty) {
        let cart = JSON.parse(localStorage.getItem("cart")) || {};

        if (cart[id]) {
            cart[id].qty = qty; // ✅ only update quantity
            localStorage.setItem("cart", JSON.stringify(cart));
        }
    }

    function isCartItemExists(id) {
        let cart = JSON.parse(localStorage.getItem("cart")) || {};
        return cart.hasOwnProperty(id);
    }


    function removeCartItem(id) {
        let cart = JSON.parse(localStorage.getItem("cart")) || {};
        if (cart[id]) {
            delete cart[id];
            localStorage.setItem("cart", JSON.stringify(cart));
        }
    }

    function calculateCartTotals() {
        let cart = JSON.parse(localStorage.getItem("cart")) || {};

        let items = Object.values(cart);
        let grandTotal = 0;

        // Add subtotal to each item
        items = items.map(item => {
            item.subtotal = item.price * item.qty;
            grandTotal += item.subtotal;
            return item;
        });

        return grandTotal;
    }


    window.updateCartItemCount = function updateCartItemCount() {
        let cart = JSON.parse(localStorage.getItem("cart")) || {};
        let countItems = Object.keys(cart).length;
        console.log(countItems);
        if (countItems > 0) {
            $("#cart-count, #m-cart-count").text(countItems).removeClass("invisible opacity-0").addClass("opacity-100");
        } else {
            $("#cart-count, #m-cart-count").text(countItems).addClass("invisible opacity-0").removeClass("opacity-100");
        }
        $(".product-count").text(countItems);
    }


    function saveCartItem(id, title, price, image, qty = 1) {
        let cart = JSON.parse(localStorage.getItem("cart")) || {};

        cart[id] = {
            id,
            title,
            price,
            image,
            qty
        };

        localStorage.setItem("cart", JSON.stringify(cart));
    }


    window.restoreCart = function restoreCart() {
        let cart = JSON.parse(localStorage.getItem("cart")) || {};
        let $miniCartItems = $("#mini-cart-items");

        // Remove only cart items, keep placeholder
        $miniCartItems.find(".cart-item").remove();

        let totalPrice = 0;

        if (Object.keys(cart).length === 0) {
            $("#cart-placeholder").show();
            $(".basket-price-sum").text('0₾');
            changePriceInCartBtn(0); // also update button text
            return;
        } else {
            $("#cart-placeholder").hide();
        }

        $.each(cart, function (id, item) {
            totalPrice += parseFloat(item.price) * parseInt(item.qty);

            let itemHtml = `
        <div id="cart-item-${item.id}" class="flex items-center gap-2 pr-[7px] cart-item border-b border-gray-200 py-[10px]">
            <input type="hidden" name="cart_items[${item.id}][]" value="${item.id}">
            <input type="hidden" name="cart_price[${item.id}][]" value="${item.price}">
            <input type="hidden" name="quantity[${item.id}][]" value="${item.qty}">
            <img src="${item.image}" class="w-[60px] h-[60px] object-cover rounded">
            <div class="flex-1">
                <div class="text-[13px] font-custom-bold-upper">${item.title}</div>
                <div class="text-[13px] text-[var(--color-main)] font-custom-bold-upper">${item.price} ₾</div>
            </div>
            <div class="flex flex-col justify-between items-end gap-2 w-[63px]">
                <div class="items-end">
                    <svg class="h-[17px] w-[17px] remove-cart-item text-gray-500 hover:text-red-700 cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M216,48H176V40a24,24,0,0,0-24-24H104A24,24,0,0,0,80,40v8H40a8,8,0,0,0,0,16h8V208a16,16,0,0,0,16,16H192a16,16,0,0,0,16-16V64h8a8,8,0,0,0,0-16ZM96,40a8,8,0,0,1,8-8h48a8,8,0,0,1,8,8v8H96Zm96,168H64V64H192ZM112,104v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Zm48,0v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Z"></path></svg>
                </div>
                <div class="flex justify-between items-center gap-0.5 bg-[var(--color-main)] text-white text-sm rounded-md p-[5px] w-full">
                    <button class="h-[15px] w-[15px] cart-item-minus cursor-pointer">
                        <svg class="h-[15px] w-[15px] cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M224,128a8,8,0,0,1-8,8H40a8,8,0,0,1,0-16H216A8,8,0,0,1,224,128Z"></path></svg>
                    </button>
                    <div class="quantity" data-id="${item.id}">${item.qty}</div>
                    <button class="h-[15px] w-[15px] cart-item-plus cursor-pointer">
                        <svg class="h-[15px] w-[15px]  cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M224,128a8,8,0,0,1-8,8H136v80a8,8,0,0,1-16,0V136H40a8,8,0,0,1,0-16h80V40a8,8,0,0,1,16,0v80h80A8,8,0,0,1,224,128Z"></path></svg>
                    </button>
                </div>
            </div>
        </div>
        `;

            $miniCartItems.append(itemHtml);
        });

        // Update cart counter and total price
        let count = Object.keys(cart).length;

        // Update button badge, mini-cart counter, and total price
        $("#cart-count, #mini-cart .product-count, #m-cart-count").text(count).removeClass("invisible opacity-0").addClass("opacity-100");
        $(".basket-price-sum").text(totalPrice + ' ₾');

        // Update cart button text
        changePriceInCartBtn(totalPrice);
    }

    window.restoreCart();
    window.updateCartItemCount();
});


// In your global JS file, e.g., app.js
window.renderCart = function () {
    const container = $('#cart-items');
    let cart = JSON.parse(localStorage.getItem('cart')) || {};
    let cartItems = Object.values(cart);

    container.empty();

    if (cartItems.length === 0) {
        container.html('<p class="p-4 text-gray-500 text-center">თქვენი კალათა ცარიელია</p>');
        $('#grand-total').text('0 ₾');
        return;
    }

    let grandTotal = 0;

    cartItems.forEach((item, index) => {
        let subtotal = item.price * item.qty;
        grandTotal += subtotal;

        container.append(`
              <div class="flex flex-col  xl:!flex-row items-center bg-white p-4 shadow cart-item border-b border-b-slate-100 space-y-1.5 xl:!space-y-0">


                    <!-- Title -->
                    <div class="flex-1 text-gray-800 font-medium text-start xl:!text-left xl:!hidden order-2"><a href="">${item.title}</a></div>

                    <div class="w-full flex flex-row justify-between items-center order-1">

                    <!-- ID -->
                    <div class="hidden xl:!w-20  font-medium text-gray-700 overflow-hidden">#${item.id}</div>

                    <!-- Product Image -->
                    <div class="w-[60px] sm:w-[80px] md:w-[100px] flex-shrink-0 xl:!mx-4">
                        <img src="${item.image}" alt="Product" class="w-full aspect-square object-cover rounded">
                    </div>

                     <!-- Title -->
                    <div class="hidden xl:!block flex-1 text-gray-800 font-medium text-start xl:!text-left "><a href="">${item.title}</a></div>

                    <div class="flex flex-col sm:!flex-row items-center md:!gap-1 sm:!gap-3">
                            <!-- Price -->
                            <div class="w-fit xl:!w-24  text-gray-700 text-center ">${item.price} ₾</div>

                            <!-- Quantity -->
                            <div class="flex w-fit  justify-center  xl:!justify-start">
                                <div class="flex justify-between items-center gap-0.5 bg-[var(--color-main)] text-white text-sm rounded-md p-[5px] w-[74px]">
                                    <button class="h-[15px] w-[15px] cart-item-minus-list cursor-pointer">
                                        <svg class="h-[15px] w-[15px] cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M224,128a8,8,0,0,1-8,8H40a8,8,0,0,1,0-16H216A8,8,0,0,1,224,128Z"></path></svg>
                                    </button>
                                    <div class="quantity text-white  px-1 rounded text-center " data-id="${item.id}">${item.qty}</div>
                                    <button class="h-[15px] w-[15px] cart-item-plus-list cursor-pointer">
                                        <svg class="h-[15px] w-[15px]  cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M224,128a8,8,0,0,1-8,8H136v80a8,8,0,0,1-16,0V136H40a8,8,0,0,1,0-16h80V40a8,8,0,0,1,16,0v80h80A8,8,0,0,1,224,128Z"></path></svg>
                                    </button>
                                </div>
                            </div>

                            <!-- Total Price -->
                            <div class="w-fit xl:!w-24 font-semibold text-gray-900 subtotal text-center ">${subtotal} ₾</div>

                    </div>

                            <!-- Delete Button -->
                            <div class="w-fit xl:!w-24 text-center">
                                <button onclick="removeFromCart('${item.id}')" class="px-1 xl:!px-3 py-1.5   text-white rounded-lg  transition">
                                    <svg class="h-[25px] w-[25px] remove-cart-item text-gray-500 hover:text-red-700 cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M216,48H176V40a24,24,0,0,0-24-24H104A24,24,0,0,0,80,40v8H40a8,8,0,0,0,0,16h8V208a16,16,0,0,0,16,16H192a16,16,0,0,0,16-16V64h8a8,8,0,0,0,0-16ZM96,40a8,8,0,0,1,8-8h48a8,8,0,0,1,8,8v8H96Zm96,168H64V64H192ZM112,104v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Zm48,0v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Z"></path></svg>
                                </button>
                            </div>


                    </div>
              </div>
        `);
    });

    $('#grand-total').text(grandTotal + ' ₾');
    window.renderCartCheckout();
};


window.renderCartCheckout = function () {
    const container = $('#checkout-product-list-wrapper');
    let cart = JSON.parse(localStorage.getItem('cart')) || {};
    let cartItems = Object.values(cart);

    container.empty();

    if (cartItems.length === 0) {
        container.html('<p class="p-4 text-gray-500 text-center">თქვენი კალათა ცარიელია</p>');
        $('#grand-total').text('0 ₾');
        return;
    }

    let grandTotal = 0;

    cartItems.forEach((item, index) => {
        let subtotal = item.price * item.qty;
        grandTotal += subtotal;

        container.append(`
              <div class="flex justify-start items-center gap-2 border-b border-[#dfd5d5] py-[10px] cart-item">
                            <div class="w-[90px] h-[80px] overflow-hidden rounded-[5px] border border-[var(--color-main-secondary-light)] p-1"><img src="${item.image}" class="w-[90px] h-[80px] overflow-hidden object-cover" alt=""></div>

                            <div class="flex flex-col justify-start items-center gap-2">
                                <div class="flex-1 text-sm font-custom-bold-upper">${item.title}</div>
                                <div class="flex w-fit justify-start items-center gap-1  bg-[var(--color-main)] text-white text-sm rounded-md   px-[7px] py-[5px] mr-auto">
                                    <button class="h-[15px] w-[15px] cart-item-minus-list cursor-pointer">
                                        <svg class="h-[15px] w-[15px] cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M224,128a8,8,0,0,1-8,8H40a8,8,0,0,1,0-16H216A8,8,0,0,1,224,128Z"></path></svg>
                                    </button>
                                    <div class="quantity" data-id="${item.id}">${item.qty}</div>
                                    <button class="h-[15px] w-[15px] cart-item-plus-list cursor-pointer">
                                        <svg class="h-[15px] w-[15px]  cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M224,128a8,8,0,0,1-8,8H136v80a8,8,0,0,1-16,0V136H40a8,8,0,0,1,0-16h80V40a8,8,0,0,1,16,0v80h80A8,8,0,0,1,224,128Z"></path></svg>
                                    </button>
                                </div>

                            </div>
                            <div class="flex flex-col justify-between items-center ml-auto h-[80px]">
                                <button onclick="removeFromCart('${item.id}')" class="px-3 py-1.5   text-white rounded-lg  transition">
                                    <svg class="h-[20px] w-[20px] remove-cart-item text-gray-500 hover:text-red-700 cursor-pointer" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" fill="currentColor"><path d="M216,48H176V40a24,24,0,0,0-24-24H104A24,24,0,0,0,80,40v8H40a8,8,0,0,0,0,16h8V208a16,16,0,0,0,16,16H192a16,16,0,0,0,16-16V64h8a8,8,0,0,0,0-16ZM96,40a8,8,0,0,1,8-8h48a8,8,0,0,1,8,8v8H96Zm96,168H64V64H192ZM112,104v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Zm48,0v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Z"></path></svg>
                                </button>
                                <div class="font-custom-bold-upper text-[var(--color-main)] text-nowrap subtotal"> ${subtotal} ₾</div>
                            </div>
                        </div>
        `);
    });

    $('#grand-total').text(grandTotal + ' ₾');
};
