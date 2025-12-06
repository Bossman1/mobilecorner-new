@if ($paginator->hasPages())
    <nav role="navigation" aria-label="{{ __('Pagination Navigation') }}" class="flex flex-col sm:flex-row items-center justify-between my-6">

        {{-- Showing items --}}
        <div class="mb-2 sm:mb-0">
            <p class="text-sm text-gray-700 leading-5">
                {!! __('pagination.showing') !!}
                @if ($paginator->firstItem())
                    <span class="font-medium">{{ $paginator->firstItem() }}</span>
                    {!! __('pagination.to') !!}
                    <span class="font-medium">{{ $paginator->lastItem() }}</span>
                @else
                    {{ $paginator->count() }}
                @endif
                {!! __('pagination.of') !!}
                <span class="font-medium">{{ $paginator->total() }}</span>
                {!! __('pagination.results') !!}
            </p>
        </div>

        {{-- Pagination buttons --}}
        <span class="relative z-0 inline-flex rtl:flex-row-reverse shadow-sm rounded-md">

            {{-- Previous --}}
            @if ($paginator->onFirstPage())
                <span aria-disabled="true" aria-label="{{ __('pagination.previous') }}">
                    <span class="relative inline-flex items-center px-4 py-2 text-sm font-medium text-gray-400 bg-white border border-gray-300 cursor-default leading-5 rounded-l-md">
                        {{ __('pagination.previous') }}
                    </span>
                </span>
            @else
                <button onclick="loadCategoryOnPage({{ $paginator->currentPage() - 1 }})"
                        class="cursor-pointer relative inline-flex items-center px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-l-md leading-5 hover:bg-[#7961b7] hover:text-white focus:outline-none focus:ring ring-[#7961b7] focus:border-[#7961b7] active:bg-[#674fa5] active:text-white transition ease-in-out duration-150">
                    {{ __('pagination.previous') }}
                </button>
            @endif

            {{-- Page numbers --}}
            @foreach ($paginator->links()->elements[0] as $page => $url)
                @if ($page == $paginator->currentPage())
                    <span aria-current="page">
                        <span class="relative inline-flex items-center px-4 py-2 -ml-px text-sm font-medium text-white bg-[#7961b7] border border-[#7961b7] cursor-default leading-5">
                            {{ $page }}
                        </span>
                    </span>
                @else
                    <button onclick="loadCategoryOnPage({{ $page }})"
                            class="cursor-pointer relative inline-flex items-center px-4 py-2 -ml-px text-sm font-medium text-gray-700 bg-white border border-gray-300 leading-5 hover:bg-[#7961b7] hover:text-white focus:outline-none focus:ring ring-[#7961b7] focus:border-[#7961b7] active:bg-[#674fa5] active:text-white transition ease-in-out duration-150">
                        {{ $page }}
                    </button>
                @endif
            @endforeach

            {{-- Next --}}
            @if ($paginator->hasMorePages())
                <button onclick="loadCategoryOnPage({{ $paginator->currentPage() + 1 }})"
                        class="cursor-pointer relative inline-flex items-center px-4 py-2 -ml-px text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-r-md leading-5 hover:bg-[#7961b7] hover:text-white focus:outline-none focus:ring ring-[#7961b7] focus:border-[#7961b7] active:bg-[#674fa5] active:text-white transition ease-in-out duration-150">
                    {{ __('pagination.next') }}
                </button>
            @else
                <span aria-disabled="true" aria-label="{{ __('pagination.next') }}">
                    <span class="relative inline-flex items-center px-4 py-2 -ml-px text-sm font-medium text-gray-400 bg-white border border-gray-300 cursor-default rounded-r-md leading-5">
                        {{ __('pagination.next') }}
                    </span>
                </span>
            @endif

        </span>
    </nav>
@endif
