<?php

use App\Models\Product;
use Diglactic\Breadcrumbs\Breadcrumbs;
use Diglactic\Breadcrumbs\Generator as Trail;



Breadcrumbs::for('home', function (Trail $trail) {
    $trail->push( __("მთავარი"), route('home'));
});

Breadcrumbs::for('pages.categories-list', function (Trail $trail, $slug = null) {
    $trail->parent('home');
    $trail->push( __("კატეგორიები"), route('pages.categories-list',$slug));
});

Breadcrumbs::for('discounted.products', function (Trail $trail) {
    $trail->parent('home');
    $trail->push( __("ფასდაკლების გვერდი"), route('discounted.products'));
});


Breadcrumbs::for('pages.full-page', function (Trail $trail, $slug=null) {
    $trail->parent('home');
    $product = Product::with('category')->where('slug', $slug)->first();
    $trail->push( __($product->category->name), route('pages.categories-list', $product->category->slug));
//    $trail->push( $product->title ?? 'Unknown', route('pages.full-page',$slug));
});

Breadcrumbs::for('pages.cart', function (Trail $trail) {
    $trail->parent('home');
    $trail->push( __("კალათა"), route('pages.cart'));
});

Breadcrumbs::for('pages.checkout', function (Trail $trail) {
    $trail->parent('home');
    $trail->push( __("გადახდის გვერდი"), route('pages.checkout'));
});

Breadcrumbs::for('pages.favorites', function (Trail $trail) {
    $trail->parent('home');
    $trail->push( __("რჩეულები"), route('pages.favorites'));
});

Breadcrumbs::for('pages.contact', function (Trail $trail) {
    $trail->parent('home');
    $trail->push( __("კონტაქტი"), route('pages.contact'));
});


