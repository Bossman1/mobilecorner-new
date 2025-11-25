<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Attribute;

class AttributeSeeder extends Seeder
{
    public function run()
    {
        $attributes = [
            ['name' => 'CPU', 'slug' => 'cpu', 'type' => 'text'],
            ['name' => 'GPU', 'slug' => 'gpu', 'type' => 'text'],
            ['name' => 'RAM', 'slug' => 'ram', 'type' => 'number', 'unit' => 'GB'],
            ['name' => 'Storage', 'slug' => 'storage', 'type' => 'number', 'unit' => 'GB'],
            ['name' => 'Screen Size', 'slug' => 'screen_size', 'type' => 'number', 'unit' => 'inch'],
        ];

        foreach ($attributes as $attr) {
            Attribute::updateOrCreate(
                ['slug' => $attr['slug']],
                $attr
            );
        }
    }
}
