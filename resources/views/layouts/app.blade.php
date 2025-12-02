<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>

    <meta name="keywords" content=""/>
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" type="image/png" href="{{ asset('assets/images/fav.png') }}">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"/>

    <meta property="og:title"
          content="@if(isset($ogTitle) && $ogTitle !=''){{$ogTitle}}@else{{ config('app.name', 'Laravel') }}@endif">
    <meta property="og:image"
          content="@if(isset($ogImage) && $ogImage !=''){{ $ogImage }}@else{{ config('app.url') }}/img/frontend/logo.png @endif">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=instrument-sans:400,500,600" rel="stylesheet"/>
{{--    <link--}}
{{--        rel="stylesheet"--}}
{{--        type="text/css"--}}
{{--        href="https://cdn.jsdelivr.net/npm/@phosphor-icons/web@2.1.2/src/duotone/style.css"--}}
{{--    />--}}
    <!-- Styles / Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <script src="/assets/js/jquery-3.7.1.min.js"></script>
    <script src="/assets/js/jquery.easing.min.js"></script>



    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/toastr.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/fonts.css') }}">
    @stack('css')


</head>

<body>

<!-- Start of Header -->
@include('layouts.partials.header')
<!-- End of Header -->



@yield('content')

<!-- Start of Footer -->
@include('layouts.partials.footer')
<!-- End of Footer -->




<script src="/assets/js/toastr.min.js"></script>
<script src="/assets/js/currency.js"></script>
@stack('js')

<script>
    $(function(){
        // Mobile menu toggle
        $("#mobile-menu-btn").click(function(){
            $("#mobile-menu").slideToggle(200);
        });

        // Mobile dropdown toggle
        $(".dropdown-toggle").click(function(){
            $(this).next("div").slideToggle(200);
        });

        // Desktop dropdown hover (hover parent OR dropdown)
        $("[data-dropdown]").each(function(){
            var $container = $(this);
            var $menu = $container.find("div").first();

            $container.on("mouseenter", function(){
                $menu.stop(true,true).fadeIn(150);
            }).on("mouseleave", function(){
                $menu.stop(true,true).fadeOut(150);
            });
        });
    });
</script>





<script>
    @if(session('success'))
    toastr.success("{{ session('success') }}");
    @endif

    @if(session('error'))
    toastr.error({!! json_encode(session('error')) !!});
    @endif
</script>

</body>
</html>

