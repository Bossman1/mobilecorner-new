<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use TCG\Voyager\Traits\Resizable;

class Product extends Model
{
    use SoftDeletes, Resizable;

    protected $fillable = [
        'category_id',
        'color_id',
        'title',
        'slug',
        'description',
        'price',
        'new_price',
        'stock',
        'sku',
        'meta',
        'status',
        'a_old_price',
        'b_old_price',
        'c_old_price',
        'a_new_price',
        'b_new_price',
        'c_new_price',
        'condition'

    ];

    protected $casts = [
        'meta' => 'array',
        'price' => 'decimal:2',
    ];


    public static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->slug)) {
                $model->slug = static::generateUniqueSlug($model->title);
            }
        });
    }

    public static function generateUniqueSlug($name)
    {
        $baseSlug = Str::slug($name);
        $slug = $baseSlug;
        $counter = 1;

        while (static::withTrashed()->where('slug', $slug)->exists()) {
            $slug = "{$baseSlug}-{$counter}";
            $counter++;
        }

        return $slug;
    }

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

    public function attributes()
    {
        return $this->belongsToMany(Attribute::class, 'product_attribute_values')
            ->withPivot(['value_id', 'value_text', 'value_number', 'value_json'])
            ->withTimestamps();
    }


    public function relatedProducts($limit = 20)
    {
        $category = $this->category;
        if (!$category) {
            return collect();
        }
        $categoryIds = $category->allRelatedCategoryIds();

        return Product::query()
            ->whereIn('category_id', $categoryIds)
            ->where('id', '!=', $this->id)
            ->where('status', 'active')
            ->inRandomOrder()
            ->limit($limit)
            ->get();
    }


    public function color()
    {
        return $this->belongsTo(Color::class);
    }

}
