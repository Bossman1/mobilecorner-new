$(function() {
    const $main = $('#main-header');
    const $sec = $('#secondary-header');
    const hideAfter = 100;
    const showAfter = 58;
    let lastScrollTop = 0;


    $(window).on('scroll load', function () {
        const scrollTop = $(this).scrollTop();
        if (scrollTop > hideAfter) {
            // scrolling down
            $main.addClass('header-hidden');
            $sec.addClass('secondary-header-fixed');
            $sec.css('transform','translateY(0px)');
        } else if (scrollTop < showAfter) {
            // scrolling up
            $main.removeClass('header-hidden');
            $sec.removeClass('secondary-header-fixed');
        }
        lastScrollTop = scrollTop;
    });

});
