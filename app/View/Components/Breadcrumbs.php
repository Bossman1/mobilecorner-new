<?php

namespace App\View\Components;

use Illuminate\View\Component;
use Diglactic\Breadcrumbs\Breadcrumbs as Trail;
use Illuminate\Support\Facades\Route;

class Breadcrumbs extends Component
{
    protected array $excludedRoutes = [
        'home'
    ];

    public function render()
    {
        $routeName = Route::currentRouteName();

        // Skip if route name matches any excluded pattern
        foreach ($this->excludedRoutes as $excluded) {
            if (fnmatch($excluded, $routeName)) {
                return '';
            }
        }

        if ($routeName && Trail::exists($routeName)) {
            return view('components.breadcrumbs', [
                'breadcrumbs' => Trail::generate($routeName, ...request()->route()->parameters()),
            ]);
        }

        return '';
    }
}
