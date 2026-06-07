<?php

namespace Database\Factories;

use App\Models\Exercicio;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Exercicio>
 */
class ExercicioFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            //treino varchar , ordem int , qntdSeries qtndRep int , peso decimal(6,2) null, descricao null
            'treino' => fake()->name(),
            'ordem' => fake()->numberBetween(1 , 25),
            'qntdSeries' => fake()->numberBetween(1 , 12),
            'qtndRep' => fake()->numberBetween(1 , 30),
            'peso' => fake()->optional()->randomFloat(2 , 1 , 9999),
            'descanso'=>fake()->numberBetween(1 , 60),
            'descricao' => fake()->optional()->sentence()
        ];
    }
}
