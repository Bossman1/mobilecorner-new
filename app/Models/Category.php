<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use TCG\Voyager\Traits\Resizable;

class Category extends Model
{
    use Resizable;
    protected $fillable = ['name', 'slug', 'description', 'parent_id', 'position'];


    public static function boot()
    {
        parent::boot();

        static::saving(function ($category) {
            if ($category->id && $category->parent_id == $category->id) {
                throw ValidationException::withMessages([
                    'parent_id' => 'A category cannot be its own parent.',
                ]);
            }
        });

        static::creating(function ($category) {
            if (empty($category->slug)) {
                $category->slug = static::generateUniqueSlug($category->name);
            }
        });
    }

    public static function generateUniqueSlug($name)
    {
        $slug = Str::slug($name);

        $count = static::where('slug', 'LIKE', "{$slug}%")->count();

        return $count ? "{$slug}-{$count}" : $slug;
    }


    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }


    public function products()
    {
        return $this->hasMany(Product::class);
    }

    // Recursive children
    public function childrenRecursive()
    {
        return $this->children()->with('childrenRecursive');
    }

    public function allDescendants($parentId)
    {
        $children = Category::where('parent_id', $parentId)->get();

        $all = collect();

        foreach ($children as $child) {
            $all->push($child); // add direct child
            $all = $all->merge($this->allDescendants($child->id)); // add all sub-children
        }

        return $all;
    }


    public function getAllParents()
    {
        $parents = collect();
        $current = $this->parent;

        while ($current) {
            $parents->push($current);
            $current = $current->parent;
        }

        return $parents;
    }

    public function parentsOf($categoryId)
    {
        $category = Category::find($categoryId);

        if (!$category) {
            return collect();
        }

        return $category->getAllParents()->reverse();
    }


}
