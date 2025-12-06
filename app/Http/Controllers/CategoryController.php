<?php

namespace App\Http\Controllers;

use App\Models\Attribute;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use function Pest\Laravel\get;


class CategoryController extends Controller
{


    protected function buildCategoryProductsQuery(Request $request, $slug)
    {


        $category = Category::where('slug', $slug)
            ->with('childrenRecursive')
            ->first();

        $categoryIds = $category->allCategoryIds();
        $productsQuery = Product::with('attributes')->whereIn('category_id', $categoryIds);


        // PRICE RANGE (make sure input names are price_min / price_max)
        if ($request->filled('price_min')) {
            $productsQuery->whereRaw('COALESCE(a_new_price, a_old_price) >= ?', [$request->price_min]);
        }

        if ($request->filled('price_max')) {
            $productsQuery->whereRaw('COALESCE(a_new_price, a_old_price) <= ?', [$request->price_max]);
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
     * GET: show   products page (no filters in URL).
     */
    public function categoriesProducts(Request $request, $slug)
    {
        $productsQuery = $this->buildCategoryProductsQuery($request, $slug);

        // Clone before pagination
        $queryForFilters = clone $productsQuery;
        $queryForPrice   = clone $productsQuery;

        $products = $productsQuery->paginate(config('siteconfig.perPage'));
        $totalProducts = $products->total();

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

        // Compute from full set (NOT paginated)
        $minPrice = $queryForPrice->min(DB::raw('COALESCE(a_new_price, a_old_price)'));
        $maxPrice = $queryForPrice->max(DB::raw('COALESCE(a_new_price, a_old_price)'));

        $category = Category::select('name','slug')->where('slug', $slug)->first();

        return view('pages.categories-list', compact(
            'products',
            'totalProducts',
            'attributeFilters',
            'minPrice',
            'maxPrice',
            'category'
        ));
    }


    /**
     * POST (AJAX): return only products + pagination as JSON.
     */
    public function categoriesProductsAjax(Request $request, $slug)
    {
        $productsQuery = $this->buildCategoryProductsQuery($request, $slug);

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
            'pagination' => view('ajax-content.category-page-pagination', ['paginator' => $products])->render(),
            'total'      => $totalProducts,
        ]);
    }


}
