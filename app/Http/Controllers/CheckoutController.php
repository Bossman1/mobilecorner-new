<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    public function index(){
        $newestProducts = Product::orderBy('created_at', 'desc')->take(8)->get()->shuffle();
       return view('pages.checkout',compact('newestProducts'));
    }
}
