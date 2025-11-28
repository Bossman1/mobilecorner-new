<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Attribute extends Model
{
    protected $fillable = ['name', 'slug', 'type', 'unit', 'options'];
    protected $casts = ['options' => 'array'];


    public static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->slug)) {
                $model->slug = static::generateUniqueSlug($model->name);
            }
        });
    }

    public static function generateUniqueSlug($name)
    {
        $slug = Str::slug($name);

        $count = static::where('slug', 'LIKE', "{$slug}%")->count();

        return $count ? "{$slug}-{$count}" : $slug;
    }

    public function values()
    {
        return $this->hasMany(ProductAttributeValue::class);
    }

    public function attribute_values()
    {
        return $this->hasOne(AttributeValue::class);
    }
}
