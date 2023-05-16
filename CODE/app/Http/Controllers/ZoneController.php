<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreZoneRequest;
use App\Models\Zone;
use Illuminate\Http\Request;

class ZoneController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $zones = Zone::all();
        return response()->json(['success'=> true, 'message'=> 'Get all zones are successfully.' ,'data'=> $zones], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreZoneRequest $request)
    {
        $zone = Zone::create([
            'code'=> request('code'),
            'numberOfTickets'=> request('numberOfTickets'),
            'stadium_id'=> request('stadium_id'),
        ]);
        return response()->json(['success'=> true, 'message'=> 'Create zone is successfully.' ,'data'=> $zone], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $zone = Zone::find($id);
        if ($zone) {
            return response()->json(['success'=> true, 'message'=> 'Get zone is successfully.' ,'data'=> $zone], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Zone id is not found.'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreZoneRequest $request, $id)
    {
        $zone = Zone::find($id);
        if ($zone) {
            $zone->update([
                'code'=> request('code'),
                'numberOfTickets'=> request('numberOfTickets'),
                'stadium_id'=> request('stadium_id'),
            ]);
            return response()->json(['success'=> true, 'message'=> 'Update zone is successfully.', 'data'=> $zone], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Zone id is not found.'], 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $zone = Zone::find($id);
        if ($zone) {
            $zone->delete();
            return response()->json(['success'=> true, 'message'=> 'Delete zone is successfully.'], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Zone id is not found.'], 404);
    }
}
