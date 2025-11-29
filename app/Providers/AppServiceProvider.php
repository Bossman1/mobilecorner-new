<?php

namespace App\Providers;

use App\Models\Category;
use App\Models\Page;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {

        View::composer('*', function ($view) {
            $categories = Category::with('bannerGroup.banners')->whereNull('parent_id')->get();
            $pages = Page::all();
            $view->with('menuCategories', $categories);
            $view->with('staticPages', $pages);
        });
    }
}
