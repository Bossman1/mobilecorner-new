<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductAttributeValue extends Model
{
    protected $fillable = ['product_id', 'attribute_id', 'value_text', 'value_number', 'value_json'];

    protected $casts = [
        'value_json' => 'array'
    ];





    public function attribute_value()
    {
        return $this->hasOne(AttributeValue::class, 'id', 'value_id');
    }


    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }

    public function attributeValue()
    {
        return $this->belongsTo(AttributeValue::class, 'attribute_value_id');
    }


    // Convenient accessor
    public function getValueAttribute()
    {
        $type = $this->attribute->type ?? 'text';
        return match ($type) {
            'number' => $this->value_number,
            'json' => $this->value_json,
            default => $this->value_text,
        };
    }
}
