<?php

use App\Http\Controllers\AjaxController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\InstallmentCallbackController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

Route::get('/',[\App\Http\Controllers\HomeController::class,'index'])->name('home');


Route::group(['prefix' => 'categories'], function () {
    Route::get('/{slug?}', [\App\Http\Controllers\CategoryController::class,'categoriesProducts'])
        ->name('pages.categories-list');
    Route::post('/filter/{slug}', [CategoryController::class, 'categoriesProductsAjax'])
        ->name('categories.products.filter');
});

Route::get('/discounted-products', [\App\Http\Controllers\ProductController::class,'discountedProducts'])
    ->name('discounted.products');

Route::post('/discounts/filter', [ProductController::class, 'discountedProductsAjax'])
    ->name('products.discounted.filter');


Route::group(['prefix' => 'pages'], function () {

    Route::get('/page/{slug}',[\App\Http\Controllers\PageController::class,'getPage'])->name('pages.page');





    Route::get('/cart',[CartController::class,'index'])->name('pages.cart');

    Route::get('/checkout',[\App\Http\Controllers\CheckoutController::class,'index'])->name('pages.checkout');

    Route::get('/favorites', [\App\Http\Controllers\FavoriteController::class,'index'])->name('pages.favorites');

    Route::get('/contact', function () {
        return view('pages.contact');
    })->name('pages.contact');


});

Route::post('/installment/checkout',[\App\Http\Controllers\InstallmentController::class,'installment'])->name('installment.checkout');

Route::get('product/{slug}',[\App\Http\Controllers\ProductController::class, 'view'])->name('pages.full-page');
Route::group(['prefix' => 'cart'], function () {
    Route::post('add-to-cart', [CartController::class, 'addItem'])->name('cart.add-to-cart');
});


Route::post('/get-content', [AjaxController::class, 'handle'])->name('ajax.call')->middleware('throttle:200,1');




// BOG CALLBACK
Route::post('/callback/bog', [InstallmentCallbackController::class, 'bog'])
    ->name('installment.bog.callback');

// TBC CALLBACK
Route::get('/callback/tbc', [InstallmentCallbackController::class, 'tbc'])
    ->name('installment.tbc.callback');

// Credo CALLBACK
Route::post('/callback/credo', [InstallmentCallbackController::class, 'credo'])
    ->name('installment.credo.callback');


// SUCCESS / FAIL pages
Route::get('/installment/success', fn() => view('installment.success'))
    ->name('installment.success');

Route::get('/installment/fail', fn() => view('installment.fail'))
    ->name('installment.fail');


Route::group(['prefix' => 'nboard'], function () {
    Voyager::routes();
});
