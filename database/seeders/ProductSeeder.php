<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\Product;
use App\Models\Attribute;
use App\Models\ProductAttributeValue;
use App\Models\ProductImage;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    public function run()
    {
        // ------------------------------------------
        // 1. Ensure categories exist
        // ------------------------------------------
        $categories = [
            ['name' => 'Smartphones', 'slug' => 'smartphones'],
            ['name' => 'Laptops', 'slug' => 'laptops'],
            ['name' => 'Tablets', 'slug' => 'tablets'],
        ];

        foreach ($categories as $c) {
            Category::updateOrCreate(['slug' => $c['slug']], $c);
        }

        $smartphones = Category::where('slug', 'smartphones')->first();

        // ------------------------------------------
        // 2. Get attributes (must be seeded earlier)
        // ------------------------------------------
        $cpu = Attribute::where('slug', 'cpu')->first();
        $gpu = Attribute::where('slug', 'gpu')->first();
        $ram = Attribute::where('slug', 'ram')->first();
        $storage = Attribute::where('slug', 'storage')->first();
        $screen = Attribute::where('slug', 'screen_size')->first();

        $attributes = compact('cpu', 'gpu', 'ram', 'storage', 'screen');

        // ------------------------------------------
        // 3. Create demo products
        // ------------------------------------------
        $products = [
            [
                'title' => 'iPhone 15 Pro Max 256GB',
                'a_old_price' => fake()->randomFloat(2, 100, 1000),
                'stock' => 50,
            ],
            [
                'title' => 'Samsung Galaxy S23 Ultra 512GB',
                'a_old_price' => fake()->randomFloat(2, 100, 1000),
                'stock' => 40,
            ],
            [
                'title' => 'Google Pixel 8 Pro 256GB',
                'a_old_price' => fake()->randomFloat(2, 100, 1000),
                'stock' => 25,
            ],
        ];

        foreach ($products as $data) {

            $product = Product::updateOrCreate(
                ['slug' => Str::slug($data['title'])],
                [
                    'category_id' => $smartphones->id,
                    'title' => $data['title'],
                    'description' => $data['title'] . ' — example product seeded.',
                    'slug' => Str::slug($data['title']),
                    'a_old_price' => $data['a_old_price'],
                    'stock' => $data['stock'],
                    'status' => 'active',
                ]
            );

            // --------------------------------------
            // 4. Seed attribute values
            // --------------------------------------
            ProductAttributeValue::updateOrCreate(
                ['product_id' => $product->id, 'attribute_id' => $cpu->id],
                ['value_text' => fake()->randomElement([
                    'Apple A17 Bionic',
                    'Qualcomm Snapdragon 8 Gen 2',
                    'Google Tensor G3'
                ])]
            );

            ProductAttributeValue::updateOrCreate(
                ['product_id' => $product->id, 'attribute_id' => $gpu->id],
                ['value_text' => fake()->randomElement([
                    'Apple GPU 5-core',
                    'Adreno 740',
                    'Mali-G715'
                ])]
            );

            ProductAttributeValue::updateOrCreate(
                ['product_id' => $product->id, 'attribute_id' => $ram->id],
                ['value_number' => fake()->randomElement([8, 12, 16])]
            );

            ProductAttributeValue::updateOrCreate(
                ['product_id' => $product->id, 'attribute_id' => $storage->id],
                ['value_number' => fake()->randomElement([128, 256, 512])]
            );

            ProductAttributeValue::updateOrCreate(
                ['product_id' => $product->id, 'attribute_id' => $screen->id],
                ['value_number' => fake()->randomElement([6.1, 6.5, 6.8])]
            );


        }
    }
}
