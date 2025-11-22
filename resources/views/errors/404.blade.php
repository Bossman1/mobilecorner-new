@extends('layouts.app')

@section('content')
    <div class="relative flex flex-col items-center justify-center min-h-screen text-center font-custom-regular my-[30px]">

        <!-- 404 Content -->
        <h1 class="text-9xl font-extrabold text-[#6750A4] drop-shadow-md">404</h1>
        <p class="mt-6 text-2xl font-semibold text-gray-800">{{ __("Oops! Page not found") }}</p>
        <p class="mt-2 text-gray-600">{{ __("The page you are looking for doesn’t exist or has been moved") }}.</p>

        <!-- Button -->
        <a href="{{ route('home') }}"
           class="mt-8 inline-block px-6 py-3   text-white text-lg font-medium rounded-xl shadow-lg  bg-[var(--color-main)] hover:bg-[var(--color-main-hover)] transition">
            {{ __("Go Back Home") }}
        </a>
    </div>
@endsection
