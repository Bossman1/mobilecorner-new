@props([
    'action' => 'submit',
    'name' => 'g-recaptcha-response',
    'formId' => null, // optional: auto submit after token
])

<input type="hidden" name="{{ $name }}" data-recaptcha-token value="">

@once
    <script src="https://www.google.com/recaptcha/api.js?render={{ config('services.recaptcha.site_key') }}"></script>
@endonce

<script>
    (function () {
        const siteKey = @json(config('services.recaptcha.site_key'));
        const action  = @json($action);
        const formId  = @json($formId);

        function refreshToken() {
            if (!window.grecaptcha) return;

            grecaptcha.ready(function () {
                grecaptcha.execute(siteKey, { action }).then(function (token) {
                    // set token for ALL hidden inputs of this action
                    document.querySelectorAll('input[data-recaptcha-token][name="{{ $name }}"]').forEach(el => {
                        el.value = token;
                    });
                });
            });
        }

        // initial token
        refreshToken();

        // refresh every 90s (tokens expire)
        setInterval(refreshToken, 90000);

        // If a formId is given, ensure token refresh right before submit
        if (formId) {
            const form = document.getElementById(formId);
            if (form) {
                form.addEventListener('submit', function () {
                    // best-effort refresh right before submit
                    refreshToken();
                });
            }
        }
    })();
</script>
