<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use TCG\Voyager\Traits\Resizable;

class Category extends Model
{
    use Resizable;
    protected $fillable = ['name', 'slug', 'description', 'parent_id', 'position', 'images','icon'];


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


    public function allParentIds()
    {
        $ids = collect();

        $parent = $this->parent;
        while ($parent) {
            $ids->push($parent->id);
            $parent = $parent->parent;
        }

        return $ids;
    }

    public function allRelatedCategoryIds()
    {
        return collect([$this->id])
            ->merge($this->allParentIds())
            ->merge($this->allCategoryIds())
            ->unique()
            ->values();
    }


    public function parentsOf($categoryId)
    {
        $category = Category::find($categoryId);

        if (!$category) {
            return collect();
        }

        return $category->getAllParents()->reverse();
    }


    public function bannerGroup()
    {
        return $this->belongsTo(BannerGroup::class);
    }

//    public function allCategoryIds()
//    {
//        $ids = collect([$this->id]);
//
//        foreach ($this->children as $child) {
//            $ids = $ids->merge($child->allCategoryIds());
//        }
//
//        return $ids;
//    }

    public function scopeBySlug($query, $slug)
    {
        return $query->where('slug', $slug);
    }


    public function allCategoryIds()
    {
        static $allCategories = null;

        // Load once
        if ($allCategories === null) {
            $allCategories = Category::select('id', 'parent_id')->get();
        }

        $ids = collect([$this->id]);

        $traverse = function ($id) use (&$ids, $allCategories, &$traverse) {
            $children = $allCategories->where('parent_id', $id);

            foreach ($children as $child) {
                $ids->push($child->id);
                $traverse($child->id);
            }
        };

        $traverse($this->id);

        return $ids->values();
    }

}
