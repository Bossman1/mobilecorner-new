<?php

namespace App\Http\Controllers;



use App\Models\AttributeValue;

use Illuminate\Http\Request;


class AjaxController extends Controller
{


    public function handle(Request $request)
    {
        $action = $request->post('action');
        return match ($action) {
            'getAttributesValue' => $this->getAttributesValue($request),
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


}
