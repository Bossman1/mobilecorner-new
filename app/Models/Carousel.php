<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;

class Carousel extends Model
{
    use Resizable;

    protected $fillable = [ 'title','image','link'];
}
