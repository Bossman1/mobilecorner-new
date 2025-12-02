<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CartController extends Controller
{

    public function index()
    {
        $newestProducts = Product::orderBy('created_at', 'desc')->take(8)->get();

        return view('pages.cart', compact('newestProducts'));
    }

    public function addItem(Request $request)
    {

        $image = $request->input('image');
        $title = $request->input('title');
        $price = $request->input('price');
        $id = $request->input('id');

        // Render Blade partial and return HTML
        $html = view('components.mini-cart-item', compact('id', 'image', 'title', 'price'))->render();

        return response()->json([
            'success' => true,
            'html' => $html,
            'id' => $id,
            'image' => $image,
            'title' => $title,
            'price'=>(int)$price,
        ]);
    }
}
