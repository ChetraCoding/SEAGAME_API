<?php

use App\Http\Controllers\CompetitionController;
use App\Http\Controllers\SportController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\StadiumController;
use App\Http\Controllers\TeamCompetitionController;
use App\Http\Controllers\TeamController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\ZoneController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('sports', SportController::class);
    
Route::get('sports/search/{sport_type}', [SportController::class, 'search']);

Route::resource('schedules', ScheduleController::class);

Route::get('schedules/search/{schedule_name}', [ScheduleController::class, 'searchBy']);

Route::resource('competitions', CompetitionController::class);

Route::resource('teams', TeamController::class);

Route::resource('tickets', TicketController::class);

Route::resource('stadiums', StadiumController::class);

Route::resource('zones', ZoneController::class);