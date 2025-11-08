<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('index');
})->name('home');


Route::group(['prefix' => 'categories'], function () {

    Route::get('/', function () {
        return view('pages.categories-list');
    })->name('pages.categories-list');

});

Route::group(['prefix' => 'nboard'], function () {
    Voyager::routes();
});
