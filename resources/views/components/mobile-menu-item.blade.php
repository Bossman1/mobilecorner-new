@props(['item'])

<li>

    @if(isset($item['children']) && count($item['children']))

        <!-- Parent Button -->
        <button class="w-full flex justify-between items-center px-3 py-2 rounded hover:bg-gray-100">
            <span>{{ $item['title'] }}</span>
            <span data-arrow class="transition-transform">
                <x-dynamic-component :component="'phosphor-caret-down'" class="h-[24px] w-[24px]" />
            </span>
        </button>

        <!-- Children -->
        <ul class="max-h-0 overflow-hidden pl-6 transition-all duration-300 space-y-2">
            @foreach($item['children'] as $child)
                @include('components.mobile-menu-item', ['item' => $child])
            @endforeach
        </ul>

    @else

        <!-- Simple link -->
        <a href="{{ $item['url'] ?? '#' }}" class="block px-3 py-2 rounded hover:bg-gray-100">
            {{ $item['title'] }}
        </a>

    @endif

</li>
