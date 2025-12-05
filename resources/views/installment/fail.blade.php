@extends('layouts.app')

@section('content')
    <div class="container mx-auto p-8 text-center">
        <h1 class="text-3xl font-bold text-red-600">გადახდა ვერ შესრულდა!</h1>
        <p class="mt-4">გთხოვთ სცადოთ ხელახლა.</p>

        <a href="/" class="mt-6 inline-block bg-red-600 text-white px-6 py-3 rounded-md">
            დაბრუნება
        </a>
    </div>
@endsection
