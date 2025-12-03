<div id="hs-full-screen-modal" class="hs-overlay hidden size-full fixed top-0 start-0 z-80 overflow-x-hidden overflow-y-auto  font-custom-regular" role="dialog" tabindex="-1" aria-labelledby="hs-full-screen-label">
    <div class="hs-overlay-open:mt-0 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-10 opacity-0 transition-all max-w-full   h-full">
        <div class="flex flex-col bg-white pointer-events-auto max-w-full  ">
            <div class="flex justify-between items-center py-3 px-4 border-b border-gray-200  ">
                <h3 id="hs-full-screen-label" class="font-bold text-gray-800  ">
                    მოძებნე სასურველი პროდუქტი
                </h3>
                <button type="button" class="size-8 inline-flex justify-center items-center gap-x-2 rounded-full border border-transparent bg-gray-100 text-gray-800 hover:bg-gray-200 focus:outline-hidden focus:bg-gray-200 disabled:opacity-50 disabled:pointer-events-none dark:bg-neutral-700 dark:hover:bg-neutral-600 dark:text-neutral-400 dark:focus:bg-neutral-600" aria-label="Close" data-hs-overlay="#hs-full-screen-modal">
                    <span class="sr-only">Close</span>
                    <svg class="shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M18 6 6 18"></path>
                        <path d="m6 6 12 12"></path>
                    </svg>
                </button>
            </div>
            <div class="p-4 h-full overflow-auto ios-scroll-fix">

                <div class="flex items-center  flex-1">
                    <div class="flex w-full h-[48px]">
                        <span class="flex items-center justify-center h-full border border-[var(--color-main)] rounded-l-[12px] !border-r-0 px-3 bg-white !mr-[-1px]">
                            <x-dynamic-component :component="'phosphor-magnifying-glass'" class="h-6 w-6 text-[var(--color-main)] !rounded-r-[0px] !border-r-transparent"/>
                        </span>
                        <x-input :options="['mobile-search-input']" class="flex-1 !h-full !rounded-none !border-[var(--color-main)] !border-l-0 focus:!outline-none !rounded-r-[12px] !rounded-l-[0px]  focus:!ring-0 !border-l-transparent" placeholder="ძიება"/>
                    </div>
                </div>
                <x-line class="!my-[20px]" />
                <div class="grid grid-cols-2 gap-3" mobile-search-wrp>
                    @for($i = 0; $i < 10; $i++)
                        <div class="flex flex-col justify-center items-center gap-2 border border-[var(--color-main)]  rounded-lg p-3">
                            <a href="">
                                <img src="{{ asset('assets/images/temp/img1.webp') }}" class="w-[100px] h-[100px] object-cover rounded">
                            </a>
                            <div class="text-[14px] font-custom-bold-upper">სახელი აქ იქნება რამე და დიდი თუა უნდა მოვჭრათ</div>
                            <div class="text-[20px] text-[var(--color-main)] font-custom-bold-upper">399 ₾</div>
                        </div>
                    @endfor
                </div>
                <p class="mt-1 text-gray-800 dark:text-neutral-400 text-center hidden">
                    ჩაწერეთ საძიებო სიტყვა.
                </p>
            </div>
            <div class="flex justify-end items-center gap-x-2 py-3 px-4 mt-auto border-t border-gray-200 dark:border-neutral-700">
                <button type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-2xs hover:bg-gray-50 focus:outline-hidden focus:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none   dark:border-neutral-700  " data-hs-overlay="#hs-full-screen-modal">
                    დახურვა
                </button>

            </div>
        </div>
    </div>
</div>
