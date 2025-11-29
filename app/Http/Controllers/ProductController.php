<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function view($slug){
        $product = Product::where('slug', $slug)->first();
        if (! $product) {
            abort(404);
        }

        return view('pages.full-page', compact('product'));
    }
}
