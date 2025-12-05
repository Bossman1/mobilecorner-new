<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('installments', function (Blueprint $table) {
            $table->id();
            $table->string('fname')->nullable();
            $table->string('lname')->nullable();
            $table->string('phone')->nullable();
            $table->string('city')->nullable();
            $table->string('address')->nullable();
            $table->string('comment')->nullable();
            $table->text('transaction_id')->nullable();
            $table->enum('provider',['tbc','credo','bog'])->default('tbc');
            $table->string('ip')->default('pending');
            $table->enum('status',['pending','paid','failed'])->default('pending');
            $table->decimal('total_amount', 12, 2)->default(0);
            $table->string('gateway_order_id')->nullable();
            $table->string('gateway_session_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('installments');
    }
};
