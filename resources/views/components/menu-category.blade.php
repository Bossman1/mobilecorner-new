@props(['category'])

<li class="relative group hover:bg-[var(--color-main-hover)] hover:text-white transition-colors duration-200 flex items-center justify-between mx-[12px] hover:rounded-[10px]">

    {{-- Main category button --}}
    <a href="" class="flex-1 p-3 pl-1 flex items-center gap-1.5">
        @php
            if ($category->icons){
                $icon =  'phosphor-'.$category->icons;
            }else{
                 $icon =  'phosphor-folder';
            }
        @endphp


        <x-dynamic-component :component="$icon" class="h-[23px] w-[23px] !text-black/80 group-hover:!text-white"/>
        <span class="text-[14px] text-black/80 group-hover:text-white transition-colors duration-200">
            {{ $category->name }}
        </span>
    </a>

    {{-- Show arrow only if it has children --}}
    @if($category->children->isNotEmpty())
        <span class="pr-3 text-black/60 group-hover:text-white transition-colors duration-200">
            <x-dynamic-component :component="'phosphor-caret-right'" class="h-[16px] w-[16px]"/>
        </span>
    @endif

    {{-- Submenu --}}
    @if($category->children->isNotEmpty())
        <div class="absolute left-[100%] top-0 ml-2 md:min-w-[480px] bg-white text-black shadow-xl rounded-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-x-3 group-hover:translate-x-0 p-6 z-10">

            <div class="grid grid-cols-2 gap-x-10 gap-y-8">
                @foreach($category->children as $child)
                    <div>
                        <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                            {{ $child->name }}
                        </h3>

                        {{-- Sub-child levels --}}
                        @if($child->children->isNotEmpty())
                            <ul class="space-y-1">
                                @foreach($child->children as $sub)
                                    <li>
                                        <a href=""
                                           class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">
                                            {{ $sub->name }}
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        @endif
                    </div>
                @endforeach
            </div>
        </div>
    @endif
</li>
