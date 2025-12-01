<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function view($slug){
        $product = Product::with(['attributes.attribute_values','color'])->where('slug', $slug)->first();
        $relatedProducts = $product->relatedProducts();

        if (!$product) {
            abort(404);
        }

        return view('pages.full-page', compact('product', 'relatedProducts'));
    }
}
