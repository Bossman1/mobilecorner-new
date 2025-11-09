<?php

use Diglactic\Breadcrumbs\Breadcrumbs;
use Diglactic\Breadcrumbs\Generator as Trail;



Breadcrumbs::for('home', function (Trail $trail) {
    $trail->push( __("Home"), route('home'));
});

Breadcrumbs::for('pages.categories-list', function (Trail $trail) {
    $trail->parent('home');
    $trail->push( __("Categories"), route('pages.categories-list'));
});

Breadcrumbs::for('pages.full-page', function (Trail $trail) {
    $trail->parent('home');
    $trail->push( __("Product"), route('pages.full-page'));
});


