<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CartController extends Controller
{
    public function addItem(Request $request)
    {
        $id = Str::uuid(); // unique ID for the item
        $image = $request->input('image');
        $title = $request->input('title');
        $price = $request->input('price');

        // Render Blade partial and return HTML
        $html = view('components.mini-cart-item', compact('id', 'image', 'title', 'price'))->render();

        return response()->json([
            'success' => true,
            'html' => $html,
            'id' => $id,
            'price'=>(int)$price,
        ]);
    }
}
