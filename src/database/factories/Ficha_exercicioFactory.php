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
            'ficha_id' => \App\Models\Ficha::inRandomOrder()->first()->id,
            'exercicio_id' => \App\Models\Exercicio::inRandomOrder()->first()->id,
            'dias_semana' => fake()->randomElement(['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom']),
            'ordem' => fake()->numberBetween(1 , 25),
            'qntdSeries' => fake()->numberBetween(1 , 12),
            'qntdRep' => fake()->numberBetween(1 , 30),
            'peso' => fake()->optional()->randomFloat(2 , 1 , 9999),
            'descanso'=>fake()->numberBetween(1 , 60),
            'descricao' => fake()->optional()->sentence()
        ];
    }
}
