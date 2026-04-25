<?php

namespace Database\Factories;

use App\Models\Ficha_exercicio;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Ficha_exercicio>
 */
class Ficha_exercicioFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            //ficha_id , exercicio_id , dias_semana()
            'ficha_id' => \App\Models\Ficha::inRandomOrder()->first()->id,
            'exercicio_id' => \App\Models\Exercicio::inRandomOrder()->first()->id,
            'dias_semana' => fake()->randomElement(['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom'])
        ];
    }
}
