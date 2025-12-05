<?php

namespace App\Services\Installment;

use App\Models\Installment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use TCG\Voyager\Facades\Voyager;


class BogInstallmentService
{
    public function createOrder(Installment $order, Request $request): array
    {

        // === 1) OAuth token ===
        $clientId = config('services.bog.client_id');
        $clientSecret = config('services.bog.client_secret');
        $tokenUrl = config('services.bog.token_url'); // default: oauth2.bog.ge/...

        $tokenResponse = Http::asForm()
            ->withBasicAuth($clientId, $clientSecret)
            ->post($tokenUrl, [
                'grant_type' => 'client_credentials',
            ]);

        if (!$tokenResponse->successful() || !$tokenResponse->json('access_token')) {
            throw new \RuntimeException('BOG token request failed: ' . $tokenResponse->body());
        }

        $accessToken = $tokenResponse->json('access_token');

        // === 2) Build basket from order items ===
        $basket = [];
        foreach ($order->items()->with('product')->get() as $item) {

//            $productImage = json_decode($item->product->images)[0] ??  '';
//            $imagePath = Voyager::image($productImage) ?? '';

            $basket[] = [
                'quantity' => $item->qty,
                'unit_price' => (float)$item->unit_price,
                'product_id' => $item->product_id,
                'description' => $item->product->title ?? ('Product #' . $item->product_id),
//                'image' => $imagePath ?? null
            ];
        }


        $apiUrl = config('services.bog.order_url'); // default: api.bog.ge/payments/v1/ecommerce/orders

        // If you need month/discount_code, save them on order or pass via request
        $requestBody = [
//            'callback_url'   => route('installment.bog.callback'), // create later
            'callback_url' => 'https://mobilecorner.ge/bog-callback.php', // create later
            'payment_method' => ['bog_loan'],
            'config' => [
                'loan' => [
                    'month' => $request->post('bog_month'),
                    'type' => $request->post('bog_discount_code')
                ],
            ],
            'purchase_units' => [
                'currency' => 'GEL',
                'total_amount' => (float)$order->total_amount,
                'basket' => $basket,
            ],
            'redirect_urls' => [
                'fail' => route('installment.fail'),
                'success' => route('installment.success'),
            ],
        ];

        $apiResponse = Http::withToken($accessToken)
            ->withHeaders(['Accept-Language' => 'ka', 'Content-Type' => 'application/json', 'Accept' => 'application/json'])
            ->post($apiUrl, $requestBody);

        if (!$apiResponse->successful()) {
            throw new \RuntimeException('BOG API error: ' . $apiResponse->body());
        }


        $redirectUrl = data_get($apiResponse->json(), '_links.redirect.href');
        $order_id = data_get($apiResponse->json(), 'id');

        if (!$redirectUrl) {
            throw new \RuntimeException('BOG redirect URL missing: ' . $apiResponse->body());
        }

        // Optionally store some IDs
        $order->update([
            'gateway_order_id' => data_get($apiResponse->json(), 'order_id'),
        ]);

        return ['redirect_url' => $redirectUrl, 'order_id' => $order_id];
    }
}
