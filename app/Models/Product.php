<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'category_id', 'title', 'slug', 'description', 'price', 'new_price', 'stock', 'sku', 'meta', 'status'
    ];

    protected $casts = [
        'meta' => 'array',
        'price' => 'decimal:2',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }


    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }

    public function attributeValues()
    {
        return $this->hasMany(ProductAttributeValue::class);
    }

    // Helper to get attribute by slug
    public function attributeValueBySlug(string $slug)
    {
        return $this->attributeValues()
            ->whereHas('attribute', fn($q) => $q->where('slug', $slug))
            ->with('attribute')
            ->first();
    }

}
