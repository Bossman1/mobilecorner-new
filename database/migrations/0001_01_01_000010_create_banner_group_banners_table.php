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
        Schema::create('banner_group_banners', function (Blueprint $table) {
            $table->id();

            $table->foreignId('banner_group_id')
                ->constrained('banner_groups')
                ->cascadeOnDelete();

            $table->foreignId('banner_id')
                ->constrained('banners')
                ->cascadeOnDelete();

            $table->timestamps();

            // Prevent duplicate relations (also auto-indexed)
            $table->unique(['banner_group_id', 'banner_id']);

            // Optional: manual composite index for faster join queries
            $table->index(['banner_group_id', 'banner_id'], 'banner_group_banner_group_banner_index');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('banner_group_banners');
    }
};
