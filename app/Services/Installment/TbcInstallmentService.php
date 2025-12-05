<?php
namespace App\Services\Installment;

use App\Models\Installment;
use Illuminate\Support\Facades\Http;

class TbcInstallmentService
{
    public function createOrder(Installment $order): string
    {
        $tokenUrl       = config('services.tbc.token_url');
        $installmentUrl = config('services.tbc.installment_url');
        $merchantKey    = config('services.tbc.merchant_key');
        $campaignId     = config('services.tbc.campaign_id');
        $apiKey         = config('services.tbc.api_key');
        $secretKey      = config('services.tbc.secret_key');

        // 1) Get token
        $tokenResponse = Http::asForm()
            ->withHeaders([
                'Authorization' => 'Basic ' . base64_encode($apiKey . ':' . $secretKey),
            ])
            ->post($tokenUrl, [
                'grant_type' => 'client_credentials',
                'scope'      => 'online_installments',
            ]);

        if (!$tokenResponse->successful()) {
            throw new \RuntimeException('TBC token error: ' . $tokenResponse->body());
        }

        $accessToken = $tokenResponse->json('access_token');


        $productsPayload = [];

        foreach ($order->items()->with('product')->get() as $item) {
            $productsPayload[] = [
                'name'     => $item->product->title ?? ('Product #' . $item->product_id),
                'price'    =>  (float)$item->unit_price * (int)$item->qty,
                'quantity' => (int)$item->qty,
            ];
        }

        $sendData = [
            'merchantKey' => $merchantKey,
            'priceTotal'  => (float)$order->total_amount,
            'campaignId'  => $campaignId,
            'invoiceId'   => (string) $order->id,
            'products'    => $productsPayload,
        ];


        $response = Http::withToken($accessToken)
            ->withHeaders(['Content-Type' => 'application/json'])
            ->withOptions(['allow_redirects' => false])
            ->post($installmentUrl, $sendData);


        $location = $response->header('Location');

        if (!$location) {
            throw new \RuntimeException('TBC Location header missing: ' . $response->body());
        }

        // Extract sessionId if you want
        $parts = explode('?sessionId=', $location);
        $sessionId = $parts[1] ?? null;

        $order->update([
            'gateway_session_id' => $sessionId,
        ]);

        return trim($location); // redirect URL
    }
}
