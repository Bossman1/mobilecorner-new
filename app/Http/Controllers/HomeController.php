<?php

namespace App\Http\Controllers;

use App\Models\Carousel;
use App\Models\Category;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {

        $carousels = Carousel::select(['images','link'])->get();

        return view('index', compact('carousels'));

    }
}
