@props([
    'position' =>'left',
    'sidebarClass' =>'',
    'contentClass' => ''
])

<div {{ $attributes->merge(['class' => 'flex-1 xl:!flex flex-col md:flex-row items-start gap-[24px]']) }}>
    @if($position == 'left')
        <aside class="w-full xl:!w-[312px] shrink-0 {{ $sidebarClass }}">
            {{ $sidebar ?? '' }}
        </aside>

        <main class="flex-1 rounded-t-[16px] {{ $contentClass }}">
            {{ $content ?? '' }}
        </main>


    @else
        <main class="flex-1 rounded-t-[16px] {{ $contentClass }}">
            {{ $content ?? '' }}
        </main>

        <aside class="w-full xl:!w-[312px] shrink-0 {{ $sidebarClass }}">
            {{ $sidebar ?? '' }}
        </aside>
    @endif
</div>
