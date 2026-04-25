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
        Schema::create('ficha' , function(Blueprint $table){
            $table->id();
            $table->foreignId("user_id")->constrained("users")->onDelete('cascade');
            $table->string('name');
            $table->date("data_inicio");
            $table->date("data_fim");
            $table->text("descricao")->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ficha');
    }
};