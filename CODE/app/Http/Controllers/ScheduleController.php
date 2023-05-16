<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreScheduleRequest;
use App\Http\Resources\ShowScheduleResource;
use App\Models\Schedule;
use Illuminate\Http\Request;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $schedules = Schedule::all();
        $schedules = ShowScheduleResource::collection($schedules);
        return response()->json(['success'=> true, 'message'=> 'Get all schedules are successfully.' ,'data'=> $schedules], 200);
    }

    /**
     * Search schedules.
     */
    public function searchBy($schedule_name)
    {
        // return $event_date;
        $schedules = Schedule::where('name', 'like', "%{$schedule_name}%")->get();
        $schedules = ShowScheduleResource::collection($schedules);
        return response()->json(['success'=> true, 'message'=> 'Search schedules are successfully.' ,'data'=> $schedules], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreScheduleRequest $request)
    {
        $schedule = Schedule::create([
            'name' => request('name'),
            'date' => request('date'),
            'description' => request('description'),
            'sport_id' => request('sport_id'),
            'stadium_id' => request('stadium_id'),
        ]);
        return response()->json(['success'=> true, 'message'=> 'Create schedule is successfully.' ,'data'=> $schedule], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $schedule = Schedule::find($id);
        if ($schedule) {
            $schedule = new ShowScheduleResource($schedule);
            return response()->json(['success'=> true, 'message'=> 'Get schedule is successfully.' ,'data'=> $schedule], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Schedule id is not found.'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreScheduleRequest $request, $id)
    {
        $schedule = Schedule::find($id);
        if ($schedule) {
            $schedule->update([
                'name' => request('name'),
                'date' => request('date'),
                'description' => request('description'),
                'sport_id' => request('sport_id'),
                'stadium_id' => request('stadium_id'),
            ]);
            return response()->json(['success'=> true, 'message'=> 'Update schedule is successfully.', 'data'=> $schedule], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Schedule id is not found.'], 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $schedule = Schedule::find($id);
        if ($schedule) {
            $schedule->delete();
            return response()->json(['success'=> true, 'message'=> 'Delete schedule is successfully.'], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Schedule id is not found.'], 404);
    }
}
