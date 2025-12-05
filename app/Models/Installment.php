<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Installment extends Model
{
    protected $fillable = [
        'fname',
        'lname',
        'phone',
        'city',
        'address',
        'comment',
        'transaction_id',
        'provider',
        'ip',
        'total_amount',
        'gateway_order_id',
        'gateway_session_id',
        'status'
    ];


    public function items(): HasMany
    {
        return $this->hasMany(InstallmentOrderItem::class);
    }
}
