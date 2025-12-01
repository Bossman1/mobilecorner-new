<?php

use App\Http\Controllers\AjaxController;
use App\Http\Controllers\CartController;
use Illuminate\Support\Facades\Route;

Route::get('/',[\App\Http\Controllers\HomeController::class,'index'])->name('home');


Route::group(['prefix' => 'categories'], function () {
    Route::get('/{slug?}', [\App\Http\Controllers\CategoryController::class,'index'])
        ->name('pages.categories-list');
});

Route::get('/discounted-products', [\App\Http\Controllers\CategoryController::class,'discountedProducts'])
    ->name('discounted.products');

Route::group(['prefix' => 'pages'], function () {

    Route::get('/page/{slug}',[\App\Http\Controllers\PageController::class,'getPage'])->name('pages.page');





    Route::get('/cart',[CartController::class,'index'])->name('pages.cart');

    Route::get('/checkout', function () {
        return view('pages.checkout');
    })->name('pages.checkout');

    Route::get('/favorites', function () {
        return view('pages.favorites');
    })->name('pages.favorites');

    Route::get('/contact', function () {
        return view('pages.contact');
    })->name('pages.contact');


});

Route::get('product/{slug}',[\App\Http\Controllers\ProductController::class, 'view'])->name('pages.full-page');
Route::group(['prefix' => 'cart'], function () {
    Route::post('add-to-cart', [CartController::class, 'addItem'])->name('cart.add-to-cart');
});


Route::post('/get-content', [AjaxController::class, 'handle'])->name('ajax.call')->middleware('throttle:200,1');


Route::group(['prefix' => 'nboard'], function () {
    Voyager::routes();
});
