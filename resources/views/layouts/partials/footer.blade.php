<div class="w-full bg-[var(--color-footer)]">
    <div class="container mx-auto">
        <div class="grid grid-cols-1 xl:!grid-cols-3 gap-[15px] md:gap-[120px] text-slate-500 text-[12px] font-custom-regular py-[20px]">
            <div>
                <div class="py-[10px] border-b border-[var(--color-main)] font-custom-bold-upper">ნავიგაცია</div>
                <div class="mt-[30px]">
                    <ul class="space-y-[15px]">
                        @if(isset($staticPages) && count($staticPages) > 0)
                            @foreach($staticPages as $staticPage)
                                @if(in_array($staticPage->position,['everywhere','footer']))
                                    <li><a href="{{ route('pages.page',$staticPage->slug) }}">{{ $staticPage->title }}</a></li>
                                @endif
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>



{{--            <div>--}}
{{--                <div class="py-[10px] border-b border-[var(--color-main)] font-custom-bold-upper">რამე სახელი</div>--}}
{{--                <div class="mt-[30px]">--}}
{{--                    <ul class="space-y-[15px]">--}}
{{--                        <li><a href="">პერსონალურ მონაცემთა დაცვის პოლიტიკა</a></li>--}}
{{--                        <li><a href="">ჩვენ შესახებ</a></li>--}}
{{--                        <li><a href="">წესები და პირობები</a></li>--}}
{{--                        <li><a href="">მიწოდების სერვისი</a></li>--}}
{{--                        <li><a href="">კარიერა</a></li>--}}
{{--                    </ul>--}}
{{--                </div>--}}
{{--            </div>--}}



            <div>
                <div class="py-[10px] border-b border-[var(--color-main)] font-custom-bold-upper">გამოგვყევი</div>
                <div class="mt-[30px]">
                    <ul class="space-y-[15px] text-[14px]">
                        <li>
                            <a href="https://www.facebook.com/mobilecorner.ge" target="_blank">
                                <div class="flex justify-start items-center gap-2">
                                    <span class="h-[25px] w-[25px] rounded-[4px] bg-[var(--color-main)] text-white flex justify-center items-center">
                                        <x-dynamic-component :component="'phosphor-facebook-logo'" class="h-[20px] w-[20px]"/>
                                    </span>
                                    <span>Facebook</span>
                                </div>
                            </a>
                        </li>


                        <li>
                            <a href="https://www.instagram.com/mobilecorner.ge" target="_blank">
                                <div class="flex justify-start items-center gap-2">
                                     <span class="h-[25px] w-[25px] rounded-[4px] bg-[var(--color-main)] text-white flex justify-center items-center">
                                        <x-dynamic-component :component="'phosphor-instagram-logo'" class="h-[20px] w-[20px]"/>
                                    </span>
                                    <span>Instagram</span>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="https://www.tiktok.com/@mobilecornerge" target="_blank">
                                <div class="flex justify-start items-center gap-2">
                                    <span class="h-[25px] w-[25px] rounded-[4px] bg-[var(--color-main)] text-white flex justify-center items-center">
                                        <x-dynamic-component :component="'phosphor-tiktok-logo'" class="h-[20px] w-[20px]"/>
                                    </span>
                                    <span>TikTok</span>
                                </div>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>


            <div>
                <div class="py-[10px] border-b border-[var(--color-main)] font-custom-bold-upper">კონტაკტი</div>
                <div class="mt-[30px]">
                    <ul class="space-y-[15px] text-[14px]">
                        <li>
                                <div class="flex justify-start items-center gap-2">
                                    <span class="h-[25px] w-[25px] rounded-[4px] bg-[var(--color-main)] text-white flex justify-center items-center">
                                        <x-dynamic-component :component="'phosphor-envelope-simple'" class="h-[20px] w-[20px]"/>
                                    </span>
                                    <span>mail@mail.com</span>
                                </div>
                        </li>

                        <li>
                                <div class="flex justify-start items-center gap-2">
                                     <span class="h-[25px] w-[25px] rounded-[4px] bg-[var(--color-main)] text-white flex justify-center items-center">
                                        <x-dynamic-component :component="'phosphor-phone'" class="h-[20px] w-[20px]"/>
                                    </span>
                                    <span>(+995) 555 11 11 11</span>
                                </div>
                        </li>

                    </ul>
                </div>
            </div>



        </div>
    </div>
</div>

<div class="w-full bg-[var(--color-footer)] text-slate-500  h-[50px] font-custom-regular border-t border-t-white border-[2px]">
    <div class="container mx-auto h-full">
        <div class="flex justify-end items-center h-full">
            <div class="text-[13px] italic">
                Copyright © 2025 Mobilecorner.ge. All rights reserved.
            </div>
        </div>
    </div>
</div>

