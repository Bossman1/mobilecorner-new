<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Support\Facades\Http;

class RecaptchaV3 implements ValidationRule
{
    public function __construct(
        protected string $action = 'submit',
        protected ?float $minScore = null
    ) {}

    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if (!$value) {
            $fail('reCAPTCHA ტოკენი აკლია');
            return;
        }

        $secret = config('services.recaptcha.secret_key');
        $minScore = $this->minScore ?? (float) config('services.recaptcha.score', 0.5);

        $res = Http::asForm()->post('https://www.google.com/recaptcha/api/siteverify', [
            'secret' => $secret,
            'response' => $value,
        ]);

        if (!$res->ok()) {
            $fail('reCAPTCHA-ს დადასტურება ვერ მოხერხდა');
            return;
        }

        $data = $res->json();

        // expected keys: success, score, action, challenge_ts, hostname, error-codes
        if (!($data['success'] ?? false)) {
            $fail('reCAPTCHA-ს დადასტურება ვერ მოხერხდა.');
            return;
        }

        if (($data['action'] ?? null) !== $this->action) {
            $fail('reCAPTCHA-ს მოქმედების შეუსაბამობა.');
            return;
        }

        if ((float)($data['score'] ?? 0) < $minScore) {
            $fail('reCAPTCHA ქულა ძალიან დაბალია.');
            return;
        }
    }
}
