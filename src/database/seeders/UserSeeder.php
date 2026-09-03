<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name'=>'admin',
            'email'=>'supercanal134@gmail.com',
            'urlImage'=>'',
            'email_verified_at'=>now(),
            'password'=>Hash::make('1234567890987654321@aA'),
            'user_name'=>'admin',
            'is_admin'=>'1'
        ]);
        User::factory()->count(50)->create();

    }
}
