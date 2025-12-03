<?php

namespace App\Http\Controllers;

use App\Models\Attribute;
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



    protected function buildDiscountedProductsQuery(Request $request)
    {
        $productsQuery = Product::with('attributes')->select('id', 'title', 'slug', 'a_old_price', 'a_new_price', 'images','condition')
            ->where(function ($q) {
                $q->where('a_new_price', '<>', '')
                    ->orWhere('b_new_price', '<>', '')
                    ->orWhere('c_new_price', '<>', '');
            });

        // PRICE RANGE (make sure input names are price_min / price_max)
        if ($request->filled('price_min')) {
            $productsQuery->where('a_new_price', '>=', $request->price_min);
        }

        if ($request->filled('price_max')) {
            $productsQuery->where('a_new_price', '<=', $request->price_max);
        }

        if ($request->filled('condition')) {
            $productsQuery->whereIn('condition', (array) $request->input('condition'));
        }

        // DYNAMIC ATTRIBUTES (name="attr[slug][]")
        if ($request->filled('attr')) {
            foreach ($request->input('attr') as $attrSlug => $values) {
                $values = array_filter((array) $values);
                if (empty($values)) {
                    continue;
                }

                $productsQuery->whereHas('attributes', function ($q) use ($attrSlug, $values) {
                    $q->where('slug', $attrSlug)
                        ->whereHas('attribute_values', function ($sub) use ($values) {
                            $sub->whereIn('value_id', $values);
                        });
                });
            }
        }

        return $productsQuery;
    }

    /**
     * GET: show discounted products page (no filters in URL).
     */
    public function discountedProducts(Request $request)
    {
        $productsQuery = $this->buildDiscountedProductsQuery($request);

        // clone for filters
        $queryForFilters = clone $productsQuery;

        $products = $productsQuery->paginate(config('siteconfig.perPage'));
        $totalProducts = $products->total();
        $heading = 'ფასდაკლებები';

        // If nothing found, normal 404
        if ($totalProducts === 0) {
            abort(404);
        }

        $productIds = $queryForFilters->pluck('id');

        $attributeFilters = Attribute::query()
            ->with(['values' => function ($q) use ($productIds) {
                $q->whereHas('productValues', function ($qq) use ($productIds) {
                    $qq->whereIn('product_id', $productIds);
                })
                    ->select('id', 'attribute_id', 'value')
                    ->groupBy('value', 'id', 'attribute_id')
                    ->orderBy('sort_order');
            }])
            ->whereHas('values.productValues', function ($q) use ($productIds) {
                $q->whereIn('product_id', $productIds);
            })
            ->get();

        // brands – you can generate them from DB or keep static like before
        $brands = ['Apple', 'Samsung', 'Xiaomi', 'Huawei', 'Oppo', 'Vivo', 'Nokia', 'Realme', 'OnePlus', 'Sony', 'Asus', 'Google', 'Honor'];
        shuffle($brands);

        $minPrice = $productsQuery->min('a_new_price');
        $maxPrice = $productsQuery->max('a_new_price');


        return view('pages.discount-list', compact(
            'products',
            'totalProducts',
            'heading',
            'attributeFilters',
            'brands',
            'minPrice',
            'maxPrice'
        ));
    }

    /**
     * POST (AJAX): return only products + pagination as JSON.
     */
    public function discountedProductsAjax(Request $request)
    {
        $productsQuery = $this->buildDiscountedProductsQuery($request);

        $products = $productsQuery->paginate(config('siteconfig.perPage'));
        $totalProducts = $products->total();

        // If nothing, return empty HTML but NOT 404
        if ($totalProducts === 0) {
            return response()->json([
                'html'       => view('ajax-content.product-block', ['products' => collect()])->render(),
                'pagination' => '',
                'total'      => 0,
            ]);
        }

        return response()->json([
            'html'       => view('ajax-content.product-block', ['products' => $products])->render(),
            'pagination' => view('ajax-content.pagination', ['paginator' => $products])->render(),
            'total'      => $totalProducts,
        ]);
    }










//old version
    //    public function discountedProducts()
//    {
//
//
//        $productsQuery = Product::select('id', 'title', 'slug', 'a_old_price', 'a_new_price', 'images')->where(function ($q) {
//            $q->where('a_new_price', '<>', '')
//                ->orWhere('b_new_price', '<>', '')
//                ->orWhere('c_new_price', '<>', '');
//        });
//
//
//        if (!$productsQuery->count()) {
//            abort(404);
//        }
//
//        $products = $productsQuery->paginate(config('siteconfig.perPage'));
//
//        $totalProducts = $products->total();
//        $heading = 'ფასდაკლებები';
//
//
//        $productIds = $productsQuery->pluck('id');
//
//        $attributeFilters = Attribute::query()
//            ->with(['values' => function ($q) use ($productIds) {
//                $q->whereHas('productValues', function ($qq) use ($productIds) {
//                    $qq->whereIn('product_id', $productIds);
//                })
//                    ->select('id', 'attribute_id', 'value')   // important!
//                    ->groupBy('value', 'id', 'attribute_id')  // remove duplicates
//                    ->orderBy('sort_order');
//            }])
//            ->whereHas('values.productValues', function ($q) use ($productIds) {
//                $q->whereIn('product_id', $productIds);
//            })
//            ->get();
//
//        return view('pages.categories-list', compact('products', 'totalProducts', 'heading', 'attributeFilters'));
//    }


}
