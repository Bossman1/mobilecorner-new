<?php

namespace App\Http\Controllers;

use App\Models\Installment;
use App\Models\InstallmentOrderItem;
use App\Models\Product;
use App\Services\Installment\BogInstallmentService;
use App\Services\Installment\CredoInstallmentService;
use App\Services\Installment\TbcInstallmentService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class InstallmentController extends Controller
{

    public function installment(
        Request                 $request,
        BogInstallmentService   $bogService,
        CredoInstallmentService $credoService,
        TbcInstallmentService   $tbcService
    ){


        $data = $request->validate([
            'customer.fname' => 'required|string|max:255',
            'customer.lname' => 'required|string|max:255',
            'customer.phone' => 'required|string|max:50',
            'customer.city' => 'required|string|max:255',
            'customer.address' => 'required|string|max:255',
            'customer.comment' => 'nullable|string',
            'bank_id' => 'required|integer|in:1,2,3',
            'items' => 'required|array|min:1',
            'items.*.id' => 'required|integer|exists:products,id',
            'items.*.qty' => 'required|integer|min:1',
            'items.*.price_category' => 'required|string',
        ]);

        $customer = $data['customer'];
        $bankId = (int)$data['bank_id'];
        $items = $data['items'];

        $bankMap = [
            1 => 'tbc',
            2 => 'credo',
            3 => 'bog',
        ];

        $bankName = $bankMap[$bankId] ?? 'Unknown';


        // 2) Load products & calculate totals from DB (secure, ignore frontend price)
        $productIds = collect($items)->pluck('id')->unique()->values();
        $products = Product::whereIn('id', $productIds)->get()->keyBy('id');

        if ($products->count() !== $productIds->count()) {
            throw ValidationException::withMessages([
                'items' => 'Some products could not be found.',
            ]);
        }

        $totalAmount = 0;
        $itemRows = [];

        foreach ($items as $row) {
            $product = $products[$row['id']];

            $unitPrice = null;
            if ($row['price_category'] === 'A') {
                $unitPrice = $product->a_new_price ?: $product->a_old_price;
            }

            if ($row['price_category'] === 'B') {
                $unitPrice = $product->b_new_price ?: $product->b_old_price;
            }

            if ($row['price_category'] === 'C') {
                $unitPrice = $product->c_new_price ?: $product->c_old_price;
            }
            $unitPrice = (float)$unitPrice;

            $qty = (int)$row['qty'];
            $lineTotal = $unitPrice * $qty;
            $totalAmount += $lineTotal;

            $itemRows[] = [
                'product_id' => $product->id,
                'qty' => $qty,
                'unit_price' => $unitPrice,
                'total_price' => $lineTotal,
            ];
        }

        if ($totalAmount <= 0) {
            throw ValidationException::withMessages([
                'items' => 'Total amount must be greater than zero.',
            ]);
        }

// send back data for bog installment
        if ($bankId == 3 && !$request->has('calculator')){
            return response()->json(['success'=>true, 'total_amount'=>$totalAmount, 'items'=>$itemRows]);
        }


        // 3) Save order + items in a transaction
        /** @var Installment $order */
        $order = DB::transaction(function () use ($customer, $bankId, $bankName, $totalAmount, $itemRows, $request) {
            $order = Installment::create([
                'fname' => $customer['fname'],
                'lname' => $customer['lname'],
                'phone' => $customer['phone'],
                'city' => $customer['city'],
                'address' => $customer['address'],
                'comment' => $customer['comment'] ?? null,
                'provider' => $bankName,
                'total_amount' => $totalAmount,
                'status' => 'pending',
                'ip' => $request->ip(),
            ]);

            foreach ($itemRows as $row) {
                $row['installment_id'] = $order->id;
                InstallmentOrderItem::create($row);
            }

            return $order;
        });


        // 4) Call appropriate bank service
        try {
            if ($bankId === 3) {
                // BOG – returns redirect URL
                $arrayResponse = $bogService->createOrder($order, $request);
                return response()->json(['redirect_url' => $arrayResponse['redirect_url'], 'order_id' => $arrayResponse['order_id']]);
            } elseif ($bankId === 2) {
                // Credo – returns form config (action + inputs)
                $formConfig = $credoService->createOrder($order);
                return response()->json(['form' => $formConfig]);
            } elseif ($bankId === 1) {
                // TBC – returns redirect URL
                $redirectUrl = $tbcService->createOrder($order);
                return response()->json(['redirect_url' => $redirectUrl]);
            }

            return response()->json([
                'message' => 'ბანკი ვერ იქნა დადგენილი.',
            ], 400);

        } catch (\Throwable $e) {
            report($e);
            $order->update(['status' => 'failed']);

            return response()->json([
                'message' => 'განვადების ინიციაცია ვერ მოხერხდა, სცადეთ მოგვიანებით.',
            ], 500);
        }


    }



    private function  dataForBogInstallment(Request $request){
        dd($request->all());
    }

}
