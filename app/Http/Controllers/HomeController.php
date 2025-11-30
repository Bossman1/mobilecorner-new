<?php

namespace App\Http\Controllers;

use App\Models\Carousel;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $carousels = Carousel::select(['images','link'])->get();
        $saledItemsOnly =  Product::where('a_new_price','!=','')->orderByDesc('created_at')->limit(20)->get();
        return view('index', compact('carousels',  'saledItemsOnly'));

    }
}
