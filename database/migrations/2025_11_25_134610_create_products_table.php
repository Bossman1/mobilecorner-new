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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('category_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('color_id')->nullable()->constrained()->nullOnDelete();
            $table->string('title');
            $table->string('slug')->unique();
            $table->text('description')->nullable();
            $table->decimal('a_old_price', 12, 2)->default(0);
            $table->decimal('b_old_price', 12, 2)->default(0)->nullable();
            $table->decimal('c_old_price', 12, 2)->default(0)->nullable();
            $table->decimal('a_new_price', 12, 2)->default(0)->nullable();
            $table->decimal('b_new_price', 12, 2)->default(0)->nullable();
            $table->decimal('c_new_price', 12, 2)->default(0)->nullable();
            $table->string('currency', 4)->default('LARI');
            $table->integer('stock')->default(1);
            $table->enum('status', ['draft','active'])->default('active');
            $table->longText('images')->nullable();
            $table->softDeletes();
            $table->timestamps();

            $table->index(['category_id']);
            $table->index(['color_id']);
            $table->index(['status']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
