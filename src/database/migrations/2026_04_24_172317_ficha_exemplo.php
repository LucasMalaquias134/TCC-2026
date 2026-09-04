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
        Schema::create('ficha_exercicio' , function(Blueprint $table){
            $table->id();
            $table->foreignId('ficha_id')->constrained('ficha')->onDelete('cascade');
            $table->foreignId('exercicio_id')->constrained('exercicio')->onDelete('cascade');
            $table->enum('dias_semana' , ['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom']);
            $table->integer('ordem')->unsigned();
            $table->integer('qntdSeries')->nullable();
            $table->integer('qntdRep')->nullable();
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
        Schema::dropIfExists('ficha_exercicio');
    }
};