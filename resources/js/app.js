import '../css/app.css';
import {initFlowbite} from "flowbite";
window.InitFlowbite = initFlowbite;
import 'lazysizes';
import 'preline';
import 'preline/dist/preline.js';
import { Fancybox } from "@fancyapps/ui";
import "@fancyapps/ui/dist/fancybox/fancybox.css";
import './scripts/header.js'
// import './global.js'
Fancybox.bind("[data-fancybox]", {
    // Custom options
});
document.addEventListener('DOMContentLoaded', () => {
    window.HSStaticMethods?.autoInit();
});

import "flatpickr/dist/flatpickr.min.css";
import "flatpickr/dist/plugins/monthSelect/style.css";
import flatpickr from "flatpickr";
import monthSelectPlugin from "flatpickr/dist/plugins/monthSelect";
import { Splide } from "@splidejs/splide";
import "@splidejs/splide/css";

import { default as georgian } from "flatpickr/dist/l10n/ka.js";
import { default as english } from "flatpickr/dist/l10n/default.js";

window.flatpickr = flatpickr;
window.flatpickrLocales = {
    ka: georgian.ka,
    en: english.default,
};
window.monthSelectPlugin = monthSelectPlugin;
window.Splide = Splide;

// import Alpine from 'alpinejs';
//
// window.Alpine = Alpine;
//
// Alpine.start();
