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


@push('js')
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const searchInput = document.getElementById("filter-search-brand");
            const checkboxes = document.querySelectorAll('[name="models[]"]');

            searchInput.addEventListener("input", function () {
                const query = this.value.toLowerCase().trim();

                checkboxes.forEach(input => {
                    // outer wrapper div that wraps the x-checkbox component
                    const outerWrapper = input.closest('x-checkbox, div')?.parentElement || input.closest('div');

                    // find label inside the checkbox component
                    const labelEl = input.closest("div").querySelector("label");
                    const labelText = labelEl ? labelEl.textContent.toLowerCase().trim() : "";

                    if (labelText.includes(query)) {
                        outerWrapper.style.display = "";
                    } else {
                        outerWrapper.style.display = "none";
                    }
                });
            });
        });
    </script>

@endpush
