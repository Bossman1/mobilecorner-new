<div class="w-full md:!w-[246px] relative hidden md:block">
    <div class="bg-white rounded-2xl shadow-md py-4">
        <ul class="divide-y divide-slate-200 [--tw-divide-opacity:1] [--tw-divide-width:90%]">

            <!-- მობილურები -->
            <li class="relative hover:bg-[var(--color-main-hover)] hover:text-white transition-colors duration-200 flex items-center justify-between group mx-[12px] hover:rounded-[10px]">
                <a href="" class="flex-1 p-3 pl-1 flex items-center gap-1.5">
                    <x-dynamic-component :component="'phosphor-device-mobile'"
                                         class="h-[23px] w-[23px] !text-black/80 group-hover:!text-white"/>
                    <span class="text-[14px] text-black/80 group-hover:text-white transition-colors duration-200">
                        მობილურები
                    </span>
                </a>
                <span class="pr-3 text-black/60 group-hover:text-white transition-colors duration-200">
                    <x-dynamic-component :component="'phosphor-caret-right'" class="h-[16px] w-[16px]"/>
                </span>

                <!-- submenu -->
                <div class="absolute left-[100%] top-0 ml-2 md:min-w-[480px] bg-white text-black shadow-xl rounded-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-x-3 group-hover:translate-x-0 p-6 z-10">

                    <div class="grid grid-cols-2 gap-x-10 gap-y-8">

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                მობილურები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Apple</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Samsung</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xiaomi</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                აქსესუარები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">ყურსასმენები</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">ქეისები</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">დამტენები</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                სმარტ საათები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Apple Watch</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Samsung Watch</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xiaomi Mi Band</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                სათამაშოები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">PlayStation</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xbox</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Nintendo</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>

            <li class="relative hover:bg-[var(--color-main-hover)] hover:text-white transition-colors duration-200 flex items-center justify-between group mx-[12px] hover:rounded-[10px]">
                <a href="" class="flex-1 p-3 pl-1 flex items-center gap-1.5">
                    <x-dynamic-component :component="'phosphor-game-controller'"
                                         class="h-[23px] w-[23px] !text-black/80 group-hover:!text-white"/>
                    <span class="text-[14px] text-black/80 group-hover:text-white transition-colors duration-200">
                        Gaming
                    </span>
                </a>

             </li>

            <!-- ლეპტოპები -->
            <li class="relative hover:bg-[var(--color-main-hover)] hover:text-white transition-colors duration-200 flex items-center justify-between group mx-[12px] hover:rounded-[10px]">
                <a href="#" class="flex-1 p-3 pl-1 flex items-center gap-1.5">
                    <x-dynamic-component :component="'phosphor-laptop'"
                                         class="h-[23px] w-[23px] !text-black/80 group-hover:!text-white"/>
                    <span class="text-[14px] text-black/80 group-hover:text-white transition-colors duration-200">
                        ლეპტოპები
                    </span>
                </a>
                <span class="pr-3 text-black/60 group-hover:text-white transition-colors duration-200">
                    <x-dynamic-component :component="'phosphor-caret-right'" class="h-[16px] w-[16px]"/>
                </span>

                <!-- submenu -->
                <div class="absolute left-[100%] top-0 ml-2 md:min-w-[480px] bg-white text-black shadow-xl rounded-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-x-3 group-hover:translate-x-0 p-6 z-10">

                    <div class="grid grid-cols-2 gap-x-10 gap-y-8">

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                მობილურები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Apple</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Samsung</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xiaomi</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                აქსესუარები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">ყურსასმენები</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">ქეისები</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">დამტენები</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                სმარტ საათები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Apple Watch</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Samsung Watch</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xiaomi Mi Band</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                სათამაშოები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">PlayStation</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xbox</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Nintendo</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </li>

            <!-- ტელევიზორები -->
            <li class="relative hover:bg-[var(--color-main-hover)] hover:text-white transition-colors duration-200 flex items-center justify-between group mx-[12px] hover:rounded-[10px]">
                <a href="#" class="flex-1 p-3 pl-1 flex items-center gap-1.5">
                    <x-dynamic-component :component="'phosphor-monitor'"
                                         class="h-[23px] w-[23px] !text-black/80 group-hover:!text-white"/>
                    <span class="text-[14px] text-black/80 group-hover:text-white transition-colors duration-200">
                        ტელევიზორები
                    </span>
                </a>
                <span class="pr-3 text-black/60 group-hover:text-white transition-colors duration-200">
                    <x-dynamic-component :component="'phosphor-caret-right'" class="h-[16px] w-[16px]"/>
                </span>

                <!-- submenu -->
                <div class="absolute left-[100%] top-0 ml-2 md:min-w-[480px] bg-white text-black shadow-xl rounded-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-x-3 group-hover:translate-x-0 p-6 z-10">

                    <div class="grid grid-cols-2 gap-x-10 gap-y-8">

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                მობილურები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Apple</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Samsung</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xiaomi</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                აქსესუარები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">ყურსასმენები</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">ქეისები</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">დამტენები</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                სმარტ საათები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Apple Watch</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Samsung Watch</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xiaomi Mi Band</a></li>
                            </ul>
                        </div>

                        <!-- Category Block -->
                        <div>
                            <h3 class="font-semibold text-[16px] text-[var(--color-main)] mb-3 border-b border-slate-200 pb-2">
                                სათამაშოები
                            </h3>
                            <ul class="space-y-1">
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">PlayStation</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Xbox</a></li>
                                <li><a href="#" class="block text-[14px] text-gray-700 hover:text-[var(--color-main)] transition-colors">Nintendo</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </li>

        </ul>
    </div>
</div>
