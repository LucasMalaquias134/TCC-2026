<?php

namespace Database\Factories;

use App\Models\Ficha;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Ficha>
 */
class FichaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => \App\Models\User::inRandomOrder()->first()->id,
            //data_inicio , data_fim , descricao , name
            'name' => fake()->name(),
            'data_inicio' => fake()->date(),
            'data_fim' => fake()->date(),
            'descricao' => fake()->optional()->sentence()
        ];
    }
}
