<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSportRequest;
use App\Http\Resources\ShowScheduleResource;
use App\Http\Resources\ShowSportResource;
use App\Http\Resources\SportResource;
use App\Models\Schedule;
use App\Models\Sport;
use Illuminate\Http\Request;

class SportController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $sports = Sport::all();
        $sports = SportResource::collection($sports);
        return response()->json(['success'=> true, 'message'=> 'Get all sports are successfully.' ,'data'=> $sports], 200);
    }

    /**
     * Search sports.
     */
    public function search($sport_type)
    {
        $sports = Sport::where('type', 'like', "%{$sport_type}%")->get();
        $sports = SportResource::collection($sports);
        return response()->json(['success'=> true, 'message'=> 'Search sports are successfully.' ,'data'=> $sports], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSportRequest $request)
    {
        $sport = Sport::create([
            'type' => request('type'),
        ]);
        return response()->json(['success'=> true, 'message'=> 'Create sport is successfully.' ,'data'=> $sport], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $sport = Sport::find($id);
        if ($sport) {
            $sport = new ShowsportResource($sport);
            return response()->json(['success'=> true, 'message'=> 'Get sport is successfully.' ,'data'=> $sport], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Sport id is not found.'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreSportRequest $request, $id)
    {
        $sport = Sport::find($id);
        if ($sport) {
            $sport->update([
                'type' => request('type'),
            ]);
            return response()->json(['success'=> true, 'message'=> 'Update sport is successfully.', 'data'=> $sport], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Sport id is not found.'], 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $sport = Sport::find($id);
        if ($sport) {
            $sport->delete();
            return response()->json(['success'=> true, 'message'=> 'Delete sport is successfully.'], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Sport id is not found.'], 404);
    }
}
