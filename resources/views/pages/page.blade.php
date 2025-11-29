@extends('layouts.app')
@section('content')

    <div class="container mx-auto font-custom-regular">

        <div class="my-[32px]">
            <x-breadcrumbs/>
            <div class="flex justify-between items-center my-[16px]">
                <div class="flex flex-col">
                    <div class="font-custom-bold-upper text-xl">{{ $page->title }}</div>
                </div>
            </div>
            <div class="grid grid-cols-1"> {{ $page->content }} </div>
        </div>
    </div>
@endsection

