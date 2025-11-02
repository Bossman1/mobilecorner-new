<?php

use Carbon\Carbon;

if (!function_exists('is_active_route')) {
    function is_active_route($route, $output = '!text-blue-500')
    {
        return request()->routeIs($route) ? $output : '';
    }
}


if (!function_exists('is_active_page')) {
    function is_active_page($slug, $output = '!text-blue-500')
    {
        return request()->routeIs('get.page') && request()->route('slug') === $slug
            ? $output
            : '';
    }
}

if (!function_exists('generateVerificationCode')) {
    function generateVerificationCode($length = 4): string
    {
        $min = (int)str_pad('1', $length, '0');
        $max = (int)str_pad('', $length, '9');
        return (string)random_int($min, $max);
    }
}


if (!function_exists('getGuard')) {
    function getGuard()
    {
        if (\Illuminate\Support\Facades\Auth::guard('owner')->check()) {
            return \Illuminate\Support\Facades\Auth::guard('owner')->user();
        } elseif (\Illuminate\Support\Facades\Auth::guard('user')->check()) {
            return \Illuminate\Support\Facades\Auth::guard('user')->user();
        } elseif (\Illuminate\Support\Facades\Auth::guard('manager')->check()) {
            return \Illuminate\Support\Facades\Auth::guard('manager')->user();
        } elseif (\Illuminate\Support\Facades\Auth::guard('worker')->check()) {
            return \Illuminate\Support\Facades\Auth::guard('worker')->user();
        }
        return false;
    }
}


if (!function_exists('trans_field')) {
    function trans_field($model, $field)
    {
        $translation = $model->translate(app()->getLocale(), true);
        return $translation->{$field} ?? $model->{$field};
    }
}


if (!function_exists('detectNumberType')) {
    function detectNumberType($number)
    {
        $number = preg_replace('/\D/', '', $number); // remove any non-digit characters

        // Private number (11 digits)
        if (strlen($number) === 11) {
            return 'private';
        }

        // Phone number with +995 or local 9-digit number
        if (strlen($number) === 12 && substr($number, 0, 3) === '995') {
            return 'phone';
        }

        if (strlen($number) === 9) {
            return 'phone';
        }

        return 'unknown';
    }
}


?>
