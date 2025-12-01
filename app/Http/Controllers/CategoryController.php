<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index($slug)
    {

        $category = Category::where('slug', $slug)
            ->with('children:id,parent_id,name')
            ->first();
        if (!$category) {
            abort(404);
        }

        $subcategoryIds = $category->children->pluck('id')->toArray();
        $subcategoryIds[] = $category->id;



        $productsQuery = Product::select('category_id', 'id', 'slug', 'title', 'a_old_price', 'a_new_price', 'images')->whereIn('category_id', $subcategoryIds)
            ->with('category'); // optional: eager load category if needed

        $products = $productsQuery->orderByDesc('created_at')->paginate(config('siteconfig.perPage'));

        $totalProducts = $products->total();
        return view('pages.categories-list', compact('products', 'totalProducts', 'category'));
    }

    public function discountedProducts()
    {


        $productsQuery = Product::select('id', 'title','slug','a_old_price', 'a_new_price', 'images')->where(function ($q) {
            $q->where('a_new_price', '<>', '')
                ->orWhere('b_new_price', '<>', '')
                ->orWhere('c_new_price', '<>', '');
        });


        if(!$productsQuery->count()){
            abort(404);
        }

        $products = $productsQuery->paginate(config('siteconfig.perPage'));

        $totalProducts = $products->total();
        $heading = 'ფასდაკლებები';
        return view('pages.categories-list', compact('products', 'totalProducts', 'heading'));
    }
}
