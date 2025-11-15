<?php

use App\Http\Controllers\CartController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('index');
})->name('home');


Route::group(['prefix' => 'categories'], function () {

    Route::get('/', function () {
        return view('pages.categories-list');
    })->name('pages.categories-list');

});

Route::group(['prefix' => 'pages'], function () {

    Route::get('/full-page', function () {
        return view('pages.full-page');
    })->name('pages.full-page');

});

Route::group(['prefix' => 'cart'], function () {
    Route::post('add-to-cart', [CartController::class, 'addItem'])->name('cart.add-to-cart');
});



Route::group(['prefix' => 'nboard'], function () {
    Voyager::routes();
});
