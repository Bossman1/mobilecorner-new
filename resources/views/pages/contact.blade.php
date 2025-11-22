@extends('layouts.app')
@section('content')

    <div class="w-full">

        <div class="container mx-auto pt-[20px] pb-[24px] font-custom-regular">
            <x-breadcrumbs />

            <x-page-component position="right"
                              sidebarClass="!w-full md:!w-[424px] shrink-0 !block md:!block"
                              contentClass="flex-1 rounded-[16px] bg-white w-full">
                <x-slot:content>
                    <h2 class="w-full text-center font-custom-bold-upper text-[16px]  md:text-[24px] text-slate-700 my-[16px] md:my-[32px]">
                        მოგვწერეთ</h2>
                    <form action="" method="post" class="px-[16px] md:px-[64px] w-full">
                        @csrf

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-[16px]">
                            <div class="w-full">
                                <x-input class="w-full" placeholder="სახელი გვარი *"/>
                            </div>

                            <div class="w-full">
                                <x-input class="w-full" placeholder="ტელეფონი *"/>
                            </div>
                            <div class="w-full">
                                <x-input class="w-full" placeholder="ელ ფოსტა *"/>
                            </div>

                            <div class="w-full">
                                <x-input class="w-full" placeholder="სათაური"/>
                            </div>

                        </div>

                        <div class="grid grid-cols-1 space-y-[16px] mt-[16px] mb-[48px]">

                            <x-textarea class="w-full !min-h-[189px]" placeholder="შეტყობინება *"/>
                            <x-button type="submit" class="w-full cursor-pointer" size="lg" variant="primary">
                                შეტყობინების გაგზავნა
                            </x-button>
                        </div>
                    </form>

                </x-slot:content>
                <x-slot:sidebar>
                    <div class="rounded-[16px] bg-white  px-[16px] md:px-[24px] py-[24px] md:py-[32px]">
                        <h3 class="font-custom-bold-upper text-[16px] md:text-[24px] text-slate-700 mb-[16px]"> დაგვიკავშირდით</h3>
                        <div class="grid grid-cols-1 gap-[16px]">
                            <div class="flex justify-start items-center gap-[8px]">
                                <div class="text-slate-600">
                                    <x-dynamic-component  class="w-full" :component="'phosphor-phone'" class="h-[24px] w-[24px]"/>
                                </div>
                                <div class="flex flex-col text-slate-600">
                                    <span class="font-custom-bold text-[14px]">ტელეფონი</span>
                                    <span class="font-custom-regular text-[16px]">+995 555 11 11 11</span>
                                </div>
                            </div>
                            <div class="flex justify-start items-center gap-[8px]">
                                <div class="text-slate-600">
                                    <x-dynamic-component :component="'phosphor-map-pin'" class="h-[24px] w-[24px]"/>
                                </div>
                                <div class="flex flex-col text-slate-600">
                                    <span class="font-custom-bold text-[14px]">მისამართი</span>
                                    <span class="font-custom-regular text-[16px]">თბილისი, ც დადიანის #15</span>
                                </div>
                            </div>
                            <div class="flex justify-start items-center gap-[8px]">
                                <div class="text-slate-600">
                                    <x-dynamic-component :component="'phosphor-envelope'" class="h-[24px] w-[24px]"/>
                                </div>
                                <div class="flex flex-col text-slate-600">
                                    <span class="font-custom-bold text-[14px]">ელ.ფოსტა</span>
                                    <span class="font-custom-regular text-[16px]">contact@mobilecorner.ge</span>
                                </div>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 gap-[16px] my-[16px]">
                            <div class="flex items-center gap-[4px]">
                                <x-dynamic-component :component="'phosphor-arrow-square-down-right'"
                                                     class="h-[24px] w-[24px] text-sky-500"/>
                                <x-line text="შემოგვიერთდით" text-class="mr-[16px]" position="start"/>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 gap-[16px] my-[16px]">
                            <div class="flex gap-[8px]">
                                <x-button class="text-slate-500" size="sm" icon="phosphor-facebook-logo"
                                          variant="outline"
                                          href="https://www.facebook.com/autoc.ge"
                                          :href-options="['target'=>'_blank']"/>
                                <x-button class="text-slate-500" size="sm" icon="phosphor-instagram-logo"
                                          variant="outline"
                                          href="https://www.instagram.com/autocareplatform"
                                          :href-options="['target'=>'_blank']"/>
                                <x-button class="text-slate-500" size="sm" icon="phosphor-tiktok-logo" variant="outline"
                                          href="https://www.tiktok.com/@autoc.ge" :href-options="['target'=>'_blank']"/>

                            </div>
                        </div>

                    </div>

                    @php
                        $banner1 = [
                            ['img' => asset('assets/images/temp/banner6.webp'), 'url' => 'https://google.ge'],
                        ];

                    @endphp
                    <x-banners
                        wrapperClass="grid grid-cols-1 gap-[12px]"
                        :options="$banner1"
                        class="mt-[24px] w-full"
                        :hrefOptions="['target' => '_blank']"
                        :imageOptions="['rel' => 'image title']"
                        imageClass="w-full"
                    />
                </x-slot:sidebar>
            </x-page-component>
        </div>

        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2977.842210079357!2d44.79223004791948!3d41.72392361563228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x404473e24beda3ed%3A0x7260c0874a59e5e5!2smobilecorner!5e0!3m2!1sen!2sge!4v1763814545217!5m2!1sen!2sge"
            width="100%" height="450px" style="border:0;" allowfullscreen="" loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
@endsection
