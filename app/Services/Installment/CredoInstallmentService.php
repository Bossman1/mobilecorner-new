<?php
namespace App\Services\Installment;

use App\Models\Installment;

class CredoInstallmentService
{
    public function createOrder(Installment $order): array
    {
        // Your own logic for merchantId, check, type, etc.
        $merchantId = config('services.credo.merchant_id', '20018');
        $secretKey  = config('services.credo.secret_key'); // for "check" md5

        $amount = 1; // in tetri

        $products = [];
        foreach ($order->items()->with('product')->get() as $item) {
            $products[] = [
                'id'     => $item->product_id,
                'title'  => $item->product->title ?? ('Product #' . $item->product_id),
                'amount' => $item->qty,
                'price'  => (int) round( $item->unit_price * $item->qty  * 100  / 0.95), // tetri
                'type'   => 1,
            ];
        }

        $payload = [
            'merchantId' => $merchantId,
            'orderCode'  => $order->id,
            'check'      => md5($merchantId . $amount . $secretKey),
            'products'   => $products,
        ];





        $actionUrl = config('services.credo.endpoint_url', 'https://credo.example.com/installment');

        // This is what JS `submitDynamicForm` will receive
        return [
            'action' => $actionUrl,
            'method' => 'POST',
            'inputs' => [
                'credoinstallment' => json_encode($payload, JSON_UNESCAPED_UNICODE),
            ],
        ];
    }
}
