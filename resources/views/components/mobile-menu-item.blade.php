@props(['item'])

<li>
    @if(isset($item['children']) && count($item['children']))

        <div class="w-full flex justify-between items-center px-3 py-2 rounded hover:bg-gray-100">
            {{-- Clickable title --}}
            <a href="{{ $item['url'] ?? '#' }}" class="flex-1">
                {{ $item['title'] }}
            </a>

            {{-- Arrow button for expand/collapse --}}
            <button type="button"
                    data-toggle-arrow
                    class="Arrow p-1 ml-2 transition-transform">
                <x-dynamic-component :component="'phosphor-caret-down'" class="h-[24px] w-[24px]" />
            </button>
        </div>

        {{-- Submenu --}}
        <ul class="submenu max-h-0 overflow-hidden pl-6 transition-all duration-300 space-y-2">
            @foreach($item['children'] as $child)
                @include('components.mobile-menu-item', ['item' => $child])
            @endforeach
        </ul>

    @else
        <a href="{{ $item['url'] ?? '#' }}" class="block px-3 py-2 rounded hover:bg-gray-100">
            {{ $item['title'] }}
        </a>
    @endif
</li>
