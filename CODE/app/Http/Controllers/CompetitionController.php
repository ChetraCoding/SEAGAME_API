<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCompetitionRequest;
use App\Http\Resources\ShowCompetitionResource;
use App\Models\Competition;
use Illuminate\Http\Request;

class CompetitionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $competitions = Competition::all();
        $competitions = ShowCompetitionResource::collection($competitions);
        return response()->json(['success'=> true, 'message'=> 'Get all competitions are successfully.' ,'data'=> $competitions], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCompetitionRequest $request)
    {
        $competition = Competition::create([
            'time' => request('time'),
            'schedule_id' => request('schedule_id'),
        ]);
        $teams = request('teams');
        $competition->teams()->sync($teams);
        return response()->json(['success'=> true, 'message'=> 'Create competition is successfully.' ,'data'=> $competition], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $competition = Competition::find($id);
        if ($competition) {
            $competition = new ShowCompetitionResource($competition);
            return response()->json(['success'=> true, 'message'=> 'Get competition is successfully.', 'data'=> $competition], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Competition id is not found.'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreCompetitionRequest $request, $id)
    {
        $competition = Competition::find($id);
        if ($competition) {
            $competition->update([
                'time' => request('time'),
                'schedule_id' => request('schedule_id'),
            ]);
            $teams = request('teams');
            $competition->teams()->sync($teams);
            return response()->json(['success'=> true, 'message'=> 'Update competition is successfully.' ,'data'=> $competition], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Competition id is not found.'], 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $competition = Competition::find($id);
        if ($competition) {
            $competition->delete();
            return response()->json(['success'=> true, 'message'=> 'Delete competition is successfully.'], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Competition id is not found.'], 404);
    }
}
