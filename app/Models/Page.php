<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Page extends Model
{

    protected $fillable = ['slug','title','content','position'];




    protected static function booted()
    {

        parent::boot();

        static::creating(function ($page) {
            if (empty($page->slug)) {
                $page->slug = static::generateUniqueSlug($page->title);
            }
        });

        static::saving(function ($page) {

            if (empty($page->slug) || $page->isDirty('title')) {
                $page->slug = static::generateUniqueSlug($page->title);
            }
        });

    }



    public static function generateUniqueSlug($name)
    {
        $slug = Str::slug($name);
        $count = static::where('slug', 'LIKE', "{$slug}%")->count();
        return $count ? "{$slug}-{$count}" : $slug;
    }

}
