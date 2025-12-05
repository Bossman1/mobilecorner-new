<?php
namespace App\Http\Controllers;

use App\Models\Installment;
use Illuminate\Http\Request;

class InstallmentCallbackController extends Controller
{
    /** --------------------------
     *  BOG CALLBACK (POST)
     * ------------------------- */
    public function bog(Request $request)
    {
        // BOG usually sends invoiceId or your order ID
        $orderId = $request->input('invoiceId') ?? null;

        if (!$orderId || !$order = Installment::find($orderId)) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        $status = $request->input('status');

        if ($status === 'approved') {
            $order->update(['status' => 'paid']);
        } else {
            $order->update(['status' => 'failed']);
        }

        return response()->json(['message' => 'OK']);
    }

    /** --------------------------
     *  TBC CALLBACK (GET)
     * ------------------------- */
    public function tbc(Request $request)
    {
        $sessionId = $request->input('sessionId');

        if (!$sessionId) {
            return redirect()->route('installment.fail');
        }

        $order = Installment::where('gateway_session_id', $sessionId)->first();

        if (!$order) {
            return redirect()->route('installment.fail');
        }

        // TBC redirects only on user action
        $result = $request->input('status'); // success/fail/cancel

        if ($result === 'success') {
            $order->update(['status' => 'paid']);
            return redirect()->route('installment.success');
        }

        $order->update(['status' => 'failed']);
        return redirect()->route('installment.fail');
    }

    /** --------------------------
     *  CREDO CALLBACK (POST)
     * ------------------------- */
    public function credo(Request $request)
    {
        $orderCode = $request->input('orderCode');

        $order = Installment::where('amount', intval($orderCode) / 100)->first();

        if (!$order) {
            return response('Order not found', 404);
        }

        $status = $request->input('status');

        if ($status === 'approved') {
            $order->update(['status' => 'paid']);
        } else {
            $order->update(['status' => 'failed']);
        }

        return response('OK', 200);
    }
}
