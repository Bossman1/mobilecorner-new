<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'resend' => [
        'key' => env('RESEND_KEY'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'slack' => [
        'notifications' => [
            'bot_user_oauth_token' => env('SLACK_BOT_USER_OAUTH_TOKEN'),
            'channel' => env('SLACK_BOT_USER_DEFAULT_CHANNEL'),
        ],
    ],
    'bog' => [
        'client_id'     => env('BOG_CLIENT_ID'),
        'client_secret' => env('BOG_CLIENT_SECRET'),
        'token_url'     => env('BOG_TOKEN_URL', 'https://oauth2.bog.ge/auth/realms/bog/protocol/openid-connect/token'),
        'order_url'     => env('BOG_ORDER_URL', 'https://api.bog.ge/payments/v1/ecommerce/orders'),
    ],
    'credo' => [
        'merchant_id'  => env('CREDO_MERCHANT_ID'),
        'secret_key'   => env('CREDO_SECRET_KEY'),
        'endpoint_url' => env('CREDO_ENDPOINT_URL'),
    ],
    'tbc' => [
        'token_url'       => env('TBC_TOKEN_URL'),
        'installment_url' => env('TBC_INSTALLMENT_URL'),
        'merchant_key'    => env('TBC_MERCHANT_KEY'),
        'campaign_id'     => env('TBC_CAMPAIGN_ID'),
        'api_key'         => env('TBC_API_KEY'),
        'secret_key'      => env('TBC_SECRET_KEY'),
    ],

];
