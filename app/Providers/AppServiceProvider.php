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

            $allCategories = Category::with(['bannerGroup.banners', 'products'])->get();

            $childrenMap = [];
            foreach ($allCategories as $cat) {
                $childrenMap[$cat->parent_id ?? 0][] = $cat;
            }

            $homePageCategories = collect($childrenMap[0] ?? []);

            $attachChildren = function ($category) use (&$attachChildren, $childrenMap) {

                // Attach children
                $category->children = collect($childrenMap[$category->id] ?? []);

                // Base products
                $merged = collect($category->products)->sortByDesc('created_at');

                // Add children products
                foreach ($category->children as $child) {
                    $attachChildren($child);
                    $merged = $merged->merge($child->all_products);
                }

                // Final product limit
                $category->all_products = $merged->sortByDesc('created_at')->take(12)->values();
            };


            foreach ($homePageCategories as $cat) {
                $attachChildren($cat);
            }

            $buildMobileMenu = function ($category) use (&$buildMobileMenu) {

                $item = [
                    'title' => $category->name,
                    'slug' => $category->slug,
                    'icon' => $category->icon,
                    'url' => route('pages.categories-list', $category->slug),
                ];

                if ($category->children->isNotEmpty()) {
                    $item['children'] = [];

                    foreach ($category->children as $child) {
                        $item['children'][] = $buildMobileMenu($child);
                    }
                }

                return $item;
            };

            $mobileMenu = [];
            foreach ($homePageCategories as $cat) {
                $mobileMenu[] = $buildMobileMenu($cat);
            }


            // Share globally — no multiple queries
            View::share([
                'staticPages' => $pages,
                'menuCategories' => $homePageCategories,
                'mobileMenu' => $mobileMenu,
            ]);

        });
    }
}
