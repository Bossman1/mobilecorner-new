<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Image extends Model
{
    protected $fillable = ['paths'];

    protected $casts = [
        'paths' => 'array',
    ];

    public function imageable()
    {
        return $this->morphTo();
    }

    protected static function booted()
    {
        static::deleting(function ($image) {
            $paths = $image->paths;
            foreach ($paths as $path) {
                if (Storage::disk('public')->exists($path)) {
                    Storage::disk('public')->delete($path);
                }
            }
        });
    }

}
