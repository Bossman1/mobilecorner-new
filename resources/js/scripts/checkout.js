$(function (){


    $(function () {

        // ===== PURCHASE BUTTON CLICK =====
        $(document).on('click', '[data-purchase]', function (e) {
            e.preventDefault();

            const $form = $('.user-information-form');

            // 1) Collect user info
            const customer = {
                fname:   $form.find('[name="fname"]').val()?.trim() || '',
                lname:   $form.find('[name="lname"]').val()?.trim() || '',
                phone:   $form.find('[name="phone"]').val()?.trim() || '',
                city:    $form.find('[name="city"]').val() || '',
                address: $form.find('[name="address"]').val()?.trim() || '',
                comment: $form.find('[name="comment"]').val()?.trim() || '',
            };

            // Simple frontend check (backend will validate too)
            if (!customer.fname || !customer.lname || !customer.phone || !customer.city || !customer.address) {
                showModal({
                    title: "შეცდომა",
                    text: 'გთხოვთ შეავსოთ სავალდებულო ველები (*)',
                });
                return;
            }

            // 2) Selected bank (radio)
            const bankId = $('input[name="payment_options"]:checked').val();
            if (!bankId) {
                showModal({
                    title: "შეცდომა",
                    text: 'გთხოვთ აირჩიოთ ბანკი'
                });
                return;
            }





            // 3) Cart from localStorage – only {id, qty}
            let cartRaw = localStorage.getItem('cart');
            let cart = {};

            try {
                cart = cartRaw ? JSON.parse(cartRaw) : {};
            } catch (e) {
                console.error('Cart parse error', e);
                cart = {};
            }

            const items = Object.values(cart).map(item => ({
                id: item.id,
                qty: item.qty,
                price_category: item.price_category,
            }));

            if (!items.length) {
                showModal({
                    title: "შეცდომა",
                    text: 'კალათა ცარიელია'
                });
                return;
            }


            // Optional: disable button while sending
            const $btn = $(this);
            $btn.prop('disabled', true).addClass('opacity-60 cursor-not-allowed');






            $.ajax({
                url: "/installment/checkout",
                type: "POST",
                data: {
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    customer: customer,
                    bank_id: bankId,
                    items: items
                },
                success: function (response) {

                    // for bog installment
                    if (bankId === '3' && response.success && response.total_amount) {

                        const cartData = {
                            customer: customer,
                            bank_id: bankId,
                            items: items,
                            amount: response.total_amount,
                            calculator:false
                        }

                        BOG.Calculator.open({
                            amount: response.total_amount,
                            onClose: () => {
                                // Modal close callback
                            },
                            onRequest: (selected, successCb, closeCb) => {
                                const { amount, month, discount_code } = selected;
                                cartData.bog_amount = amount;
                                cartData.bog_month = month;
                                cartData.bog_discount_code = discount_code;
                                fetch('/installment/checkout', {
                                    method: "POST",
                                    headers: {
                                        "Content-Type": "application/json",
                                        "Accept": "application/json",
                                        "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
                                    },
                                    body: JSON.stringify(cartData)
                                })
                                    .then(response => response.json())
                                    .then(data => {
                                         successCb(data.order_id); // open installment modal
                                        // window.location.href = data.redirect_url; //; redirect to installment page
                                        //Bog.Calculator.close() //close calculator modal
                                    })
                                    .catch(err => closeCb());
                            },
                            onComplete: ({redirectUrl}) => {
                               return true;
                            }
                        })

                        return false;
                    }



                    // We will return different responses depending on bank
                    if (response.redirect_url) {
                        // BOG / TBC style: just redirect URL
                        window.location.href = response.redirect_url;
                    } else if (response.form) {
                        // Credo style: we need to build and auto-submit a form
                        submitDynamicForm(response.form);
                    } else {
                        showModal({
                            title: "შეცდომა",
                            text: response.message || 'დაფიქსირდა შეცდომა, თავიდან სცადეთ.'
                        });

                    }
                },
                error: function (xhr) {
                    if (xhr.status === 422 && xhr.responseJSON?.errors) {
                        let errors = xhr.responseJSON.errors;
                        let msg = Object.values(errors).map(arr => arr.join('\n')).join('\n');
                        alert(msg);
                    } else {
                        showModal({
                            title: "შეცდომა",
                            text:'სერვერზე შეცდომაა, სცადეთ მოგვიანებით.'
                        });

                    }
                },
                complete: function () {
                    $btn.prop('disabled', false).removeClass('opacity-60 cursor-not-allowed');
                }
            });
        });

        // Helper for Credo – builds <form> and submits
        function submitDynamicForm(config) {
            // config = { action: "...", method: "POST", inputs: { key: value, ... } }
            const form = document.createElement('form');
            form.method = config.method || 'POST';
            form.action = config.action;

            if (config.inputs) {
                Object.keys(config.inputs).forEach(function (name) {
                    const input = document.createElement('input');
                    input.type  = 'hidden';
                    input.name  = name;
                    input.value = config.inputs[name];
                    form.appendChild(input);
                });
            }

            document.body.appendChild(form);
            form.submit();
        }

    });

});
