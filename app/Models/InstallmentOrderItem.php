<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class InstallmentOrderItem extends Model
{
    protected $fillable = [
        'installment_id', 'product_id',
        'qty', 'unit_price', 'total_price',
    ];

    public function order(): BelongsTo
    {
        return $this->belongsTo(Installment::class, 'installment_id');
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }
}
