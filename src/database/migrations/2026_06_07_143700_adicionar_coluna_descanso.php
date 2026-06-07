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
        Schema::table('exercicio', function (Blueprint $table) {
            // Adicionando a nova coluna do tipo string
            $table->integer('descanso')->nullable(); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('exercicio', function (Blueprint $table) {
            // Caso precise reverter a migration
            $table->dropColumn('descanso');
        });
    }
};
