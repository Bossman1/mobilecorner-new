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




});
