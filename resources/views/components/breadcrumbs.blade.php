@if($breadcrumbs->isNotEmpty())
    <nav class="flex items-center text-sm text-gray-500" aria-label="Breadcrumb">
        <ol class="inline-flex items-center  text-black/80 gap-1">
            @foreach ($breadcrumbs as $breadcrumb)
                @if ($loop->first)
                    <li>
                        <a href="{{ $breadcrumb->url ?? '#' }}" class="flex justify-between items-center hover:text-gray-700 gap-1">
                            <x-dynamic-component :component="'phosphor-house-line'" class="h-[16px] w-[16px] !text-black/80 group-hover:!text-white"/>
                            {{ $breadcrumb->title }}
                        </a>
                    </li>
                @elseif (!$loop->last)
                    <li class="flex items-center gap-1 text-black/80">
                        <x-dynamic-component :component="'phosphor-caret-double-right'" class="h-[16px] w-[16px] !text-black/80 group-hover:!text-white"/>
                        <a href="{{ $breadcrumb->url ?? '#' }}" class="hover:text-gray-700 capitalize">
                            {{ $breadcrumb->title }}
                        </a>
                    </li>
                @else
                    <li class="flex items-center gap-1">
                        <x-dynamic-component :component="'phosphor-caret-double-right'" class="h-[15px] w-[15px] !text-black/80 group-hover:!text-white"/>
                        <span class="text-black/80 font-medium capitalize">{{ $breadcrumb->title }}</span>
                    </li>
                @endif
            @endforeach
        </ol>
    </nav>
@endif
