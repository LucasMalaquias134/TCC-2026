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
        Schema::create('exercicio' , function(Blueprint $table){
            $table->id();
            $table->string('treino');
            $table->integer('ordem');
            $table->integer('qntdSeries');
            $table->integer('qtndRep');
            $table->decimal('peso' , 6 , 2)->nullable();
            $table->text('descricao')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exercicio');
    }
};