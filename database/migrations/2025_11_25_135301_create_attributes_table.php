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
        Schema::create('attributes', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // e.g. "CPU", "GPU", "Screen size"
            $table->string('slug')->unique(); // e.g. cpu, gpu
            $table->enum('type', ['text','number','boolean','select','json'])->default('text');
            $table->string('unit')->nullable(); // e.g. "GHz", "inch"
            $table->json('options')->nullable(); // for select type -> ['i5','i7']
            $table->timestamps();

            $table->index(['slug']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('attributes');
    }
};
