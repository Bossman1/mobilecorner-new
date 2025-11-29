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
        $homePageCategories = Category::with(['bannerGroup.banners', 'products'])
            ->whereNull('parent_id')
            ->get()
            ->map(function ($cat) {
                $ids = $cat->allCategoryIds();
                $cat->all_products = Product::whereIn('category_id', $ids)->get();
                return $cat;
            });


        return view('index', compact('carousels', 'homePageCategories'));

    }
}
