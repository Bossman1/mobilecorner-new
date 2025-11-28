<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('attribute_values', function (Blueprint $table) {
            $table->id();
            $table->foreignId('attribute_id')
                ->constrained()
                ->cascadeOnDelete();

            $table->string('value'); // The actual possible value (e.g. "8 GB", "256 GB", "Snapdragon 8 Gen 2")
            $table->string('slug')->unique()->nullable(); // Optional slug for filtering

            $table->unsignedInteger('sort_order')->default(0); // For ordering values in dropdowns

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('attribute_values');
    }
};
