<?php

namespace Database\Seeders;

use App\Models\Petition;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();


        for ($i = 0; $i < 1000000000000000; $i++) {
            Petition::create([
                'name' => 'Test User',
                'comment' => 'test@example.com',
                'ip' => '120.34.5.6.7',
                'device_info' => 'dddd',
            ]);
        }
    }
}
