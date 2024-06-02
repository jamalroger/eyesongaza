<?php

use App\Http\Controllers\MainController;
use Illuminate\Support\Facades\Route;

Route::get('status', [MainController::class, 'status']);
Route::post('petition/add', [MainController::class, 'add_petition']);

