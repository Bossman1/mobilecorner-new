import '../css/app.css';
import {initFlowbite} from "flowbite";
window.InitFlowbite = initFlowbite;
import 'lazysizes';
import 'preline';
import 'preline/dist/preline.js';
import { Fancybox } from "@fancyapps/ui";
import "@fancyapps/ui/dist/fancybox/fancybox.css";
import './scripts/header.js'
import './scripts/cart.js'
import './scripts/mobile.js'
import './scripts/favorite.js'
import './scripts/discount-filter.js'
import './scripts/categories-filter.js'
import './global.js'
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

import lightGallery from 'lightgallery';

// Plugins (optional)
import lgZoom from 'lightgallery/plugins/zoom';
import lgThumbnail from 'lightgallery/plugins/thumbnail';
import lgFullscreen from 'lightgallery/plugins/fullscreen';

// Styles
import 'lightgallery/css/lightgallery.css';
import 'lightgallery/css/lg-zoom.css';
import 'lightgallery/css/lg-thumbnail.css';
import 'lightgallery/css/lg-fullscreen.css';

// Expose globally if needed
window.lightGallery = lightGallery;
window.lgZoom = lgZoom;
window.lgThumbnail = lgThumbnail;
window.lgFullscreen = lgFullscreen;

import { showModal } from './scripts/alert';

window.showModal = showModal;

