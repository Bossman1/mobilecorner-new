window.reInitUI = function() {
    window.HSStaticMethods?.autoInit();

    if (window.InitFlowbite) window.InitFlowbite();

    if (window.reInitSplides) window.reInitSplides();

    attachSplideArrows('#prev-carousel_main', '#next-carousel_main', 'booking_1');
    if (window.initBookingTimeline) window.initBookingTimeline();
    window.initBookingTimeline((date, time) => {
        $("[data-book-date]").text(date);
        $("[data-book-time]").text(time);
        console.log('User selected date:', date, 'time:', time);
    });
};
