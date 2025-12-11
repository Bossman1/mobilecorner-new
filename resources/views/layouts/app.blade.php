<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', '') }} - ონლაინ მაღაზია</title>

    <meta name="keywords" content="მეორადი, ტელეფონები, ამერიკიდან, გარანტიით, შემოწმებული"/>
    <meta name="description" content="მეორადი და ახალი ტელეფონები ამერიკიდან">
    <meta name="og:type" content="მეორადი და ახალი ტელეფონები ამერიკიდან">
    <meta name="og:title" content="მეორადი და ახალი ტელეფონები ამერიკიდან">
    <meta name="og:image" content="https://mobilecorner.ge/assets/images/logo-fb-v2.png">
    <meta name="og:image:width" content="700">
    <meta name="og:image:height" content="600">
    <meta name="og:description" content="მეორადი და ახალი ტელეფონები ამერიკიდან">
    <meta name="og:site_name" content="Mobilecorner.ge">
    <meta name="og:locale" content="ka_GE">
    <meta name="og:ttl" content="2419200">

    <link rel="icon" type="image/png" href="{{ asset('assets/images/fav.png') }}">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"/>


    <!-- Fonts -->
{{--    <link rel="preconnect" href="https://fonts.bunny.net">--}}
{{--    <link href="https://fonts.bunny.net/css?family=instrument-sans:400,500,600" rel="stylesheet"/>--}}
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

<x-cookie-consent />
<x-scroll-to-top />


<script src="/assets/js/toastr.min.js"></script>
<script src="/assets/js/currency.js"></script>
@stack('js')



<script>
    @if(session('success'))
    toastr.success("{{ session('success') }}");
    @endif

    @if(session('error'))
    toastr.error({!! json_encode(session('error')) !!});
    @endif
</script>

@include('includes.modals.mobile-search')
</body>
</html>

