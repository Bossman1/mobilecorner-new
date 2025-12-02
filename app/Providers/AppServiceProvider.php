<?php

namespace App\Providers;

use App\Models\Category;
use App\Models\Page;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        if ($this->app->isLocal() || $this->app->environment('staging')) {
            $this->app->register(\Laravel\Telescope\TelescopeServiceProvider::class);
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Event::listen(RouteMatched::class, function () {
            $pages = Page::all();


            // Load all categories + banners + products
            $allCategories = Category::with(['bannerGroup.banners', 'products'])->get();

            // Build top-level categories
            $childrenMap = [];
            foreach ($allCategories as $cat) {
                $childrenMap[$cat->parent_id ?? 0][] = $cat;
            }
            $homePageCategories = collect($childrenMap[0] ?? []);

            // Recursive function to attach children and merge products
            $attachChildren = function ($category) use (&$attachChildren, $childrenMap) {
                $category->children = collect($childrenMap[$category->id] ?? []);

                // base products
                $category->all_products = collect($category->products ?? [])
                    ->sortByDesc('created_at');

                foreach ($category->children as $child) {
                    $attachChildren($child);

                    // merge child products
                    $category->all_products = $category->all_products
                        ->merge($child->all_products)
                        ->sortByDesc('created_at');
                }

                // LIMIT products for this category (example: 20)
                $category->all_products = $category->all_products
                    ->take(12)
                    ->values();
            };

            foreach ($homePageCategories as $cat) {
                $attachChildren($cat);
            }

            // Share globally — no multiple queries
            View::share([
                'staticPages' => $pages,
                'menuCategories' => $homePageCategories,
            ]);

        });
    }
}
