// public/js/currency.js
(() => {
    // const USD_TO_GEL = 2.7; // change as needed
    const USD_TO_GEL = window.currency_value || 2.7;

    let syncing = false;

    function formatNumber(num) {
        return Math.round(num).toString();
    }

    function getCurrency() {
        return localStorage.getItem('currency') || 'USD';
    }

    function setCurrency(currency) {
        localStorage.setItem('currency', currency);
        updateCurrency(currency);
    }

    function updateCurrency(toCurrency) {
        const els = document.querySelectorAll('[data-price]');
        els.forEach(el => {
            const usd = parseFloat(el.getAttribute('data-price'));
            if (isNaN(usd)) return;

            const text = (toCurrency === 'GEL')
                ? `${formatNumber(usd * USD_TO_GEL)} ₾`
                : `${formatNumber(usd)} $`;

            el.textContent = text;
        });
    }

    function initSwitches() {
        const switches = document.querySelectorAll('input[data-currency-switch]');
        const saved = getCurrency();

        // set initial state
        switches.forEach(sw => (sw.checked = saved === 'GEL'));
        updateCurrency(saved);

        // sync + persist
        switches.forEach(sw => {
            sw.addEventListener('change', () => {
                if (syncing) return;
                syncing = true;

                const isGEL = sw.checked;
                switches.forEach(other => { if (other !== sw) other.checked = isGEL; });

                setCurrency(isGEL ? 'GEL' : 'USD');
                syncing = false;
            });
        });
    }

    // Expose globally so Blade/other scripts can use it
    window.Currency = {
        get: getCurrency,
        set: setCurrency,
        updateDOM: updateCurrency,
        init: initSwitches,
        formatNumber,
        USD_TO_GEL
    };

    // Init when DOM is ready and notify others that Currency is ready
    document.addEventListener('DOMContentLoaded', () => {
        initSwitches();
        document.dispatchEvent(new CustomEvent('currency:ready', { detail: { currency: getCurrency() } }));
    });
})();
