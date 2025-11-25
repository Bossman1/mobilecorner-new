<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Attribute extends Model
{
    protected $fillable = ['name', 'slug', 'type', 'unit', 'options'];
    protected $casts = ['options' => 'array'];

    public function values()
    {
        return $this->hasMany(ProductAttributeValue::class);
    }
}
