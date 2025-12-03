<?php

namespace App\Http\Controllers;



use App\Models\AttributeValue;

use App\Models\Product;
use App\Models\ProductAttributeValue;
use Illuminate\Http\Request;


class AjaxController extends Controller
{


    public function handle(Request $request)
    {
        $action = $request->post('action');
        return match ($action) {
            'getAttributesValue' => $this->getAttributesValue($request),
            'deleteProductAttribute' => $this->deleteProductAttribute($request),
            'getPriceById' => $this->getPriceById($request),
            'getFavoriteContent' => $this->getFavoriteContent($request),
            default => response()->json(['error' => 'Invalid action'], 400),
        };
    }

    private function getAttributesValue(Request $request){
        $attributeValues= AttributeValue::where('attribute_id', $request->post('value'))->pluck('value','id');
        if ($attributeValues){
            return  response()->json(['success' => true,'data' => $attributeValues,  'message' => 'success']);
        }
        return response()->json(['error' => 'Invalid action'], 400);
    }


    private function deleteProductAttribute(Request $request)
    {
        $id = $request->post('value');
        $productAttributeValue = ProductAttributeValue::where('id', $id)->delete();
        if ($productAttributeValue){
            return response()->json(['success' => true, 'message' => 'success']);
        }
        return response()->json(['error' => 'Invalid action'], 400);

    }

    private function getPriceById(Request $request)
    {
        $value = $request->post('value');
        $id = $value['id'] ?? null;
        $optionId = $value['optionId'] ?? null;


        $product = Product::select(
            'a_old_price','b_old_price','c_old_price',
            'a_new_price','b_new_price','c_new_price'
        )->find($id);

        $map = [
            1 => ['new' => 'a_new_price', 'old' => 'a_old_price'],
            2 => ['new' => 'b_new_price', 'old' => 'b_old_price'],
            3 => ['new' => 'c_new_price', 'old' => 'c_old_price'],
        ];

        if (!isset($map[$optionId])) {
            return null;
        }

        $newKey = $map[$optionId]['new'];
        $oldKey = $map[$optionId]['old'];

        $new = $product->$newKey;
        $old = $product->$oldKey;


        if (!empty($new)) {
            return response()->json(['success' => true, 'new_price' => $new,'old_price'=>$old]);
        }

        return response()->json(['success' => true, 'old_price'=>$old]);




    }

    private function getFavoriteContent(Request $request)
    {
        $ids = $request->value ?? [];

        $products = Product::whereIn('id', $ids)
            ->orderByDesc('created_at')
            ->paginate(config('siteconfig.perPage')); // amount per page

        $html = view('ajax-content.product-block', [
            'products' => $products
        ])->render();

        $pagination = view('ajax-content.pagination', [
            'paginator' => $products
        ])->render();

        return response()->json([
            'success' => true,
            'data' => [
                'html' => $html,
                'pagination' => $pagination
            ]
        ]);
    }


}
