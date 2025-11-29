<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    protected $fillable = ['title','image','link'];

    public function groups()
    {
        return $this->belongsToMany(BannerGroup::class, 'banner_group_banner');
    }
}
