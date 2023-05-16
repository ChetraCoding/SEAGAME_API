<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreTeamRequest;
use App\Models\Team;
use Illuminate\Http\Request;

class TeamController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $teams = Team::all();
        return response()->json(['success'=> true, 'message'=> 'Get all teams are successfully.' ,'data'=> $teams], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTeamRequest $request)
    {
        $team = Team::create([
            'name' => request('name'),
        ]);
        return response()->json(['success'=> true, 'message'=> 'Create team is successfully.' ,'data'=> $team], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $team = Team::find($id);
        if ($team) {
            return response()->json(['success'=> true, 'message'=> 'Get team is successfully.', 'data'=> $team], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Team id is not found.'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreTeamRequest $request, $id)
    {
        $team = Team::find($id);
        if ($team) {
            $team->update([
                'name' => request('name'),
            ]);
            return response()->json(['success'=> true, 'message'=> 'Update team is successfully.', 'data'=> $team], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Team id is not found.'], 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $team = Team::find($id);
        if ($team) {
            $team->delete();
            return response()->json(['success'=> true, 'message'=> 'Delete team is successfully.'], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Team id is not found.'], 404);
    }
}
