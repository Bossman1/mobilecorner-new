<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\Page;
use Faker\Provider\Base;
use Illuminate\Http\Request;

class PageController extends BaseController
{


    public function getPage($slug)
    {
        $page = Page::where('slug', $slug)->first();
        if (! $page) {
            abort(404);
        }
        return view('pages.page', compact('page'));
    }

}
