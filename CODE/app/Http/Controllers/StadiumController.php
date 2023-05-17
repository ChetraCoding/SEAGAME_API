<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreStadiumRequest;
use App\Http\Resources\ShowStadiumResource;
use App\Models\Stadium;
use Illuminate\Http\Request;

class StadiumController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $stadiums = Stadium::all();
        $stadiums = ShowStadiumResource::collection($stadiums);
        return response()->json(['success'=> true, 'message'=> 'Get all stadiums are successfully.' ,'data'=> $stadiums], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreStadiumRequest $request)
    {
        $stadium = Stadium::create([
            'name' => request('name'),
            'address' => request('address')
        ]);
        return response()->json(['success'=> true, 'message'=> 'Create stadium is successfully.' ,'data'=> $stadium], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $stadium = Stadium::find($id);
        if ($stadium) {
            $stadium = new ShowStadiumResource($stadium);
            return response()->json(['success'=> true, 'message'=> 'Get all stadium are successfully.' ,'data'=> $stadium], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Stadium id is found.'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreStadiumRequest $request, $id)
    {
        $stadium = Stadium::find($id);
        if ($stadium) {
            $stadium->update([
                'name' => request('name'),
                'address' => request('address')
            ]);
            return response()->json(['success'=> true, 'message'=> 'Get all stadium are successfully.' ,'data'=> $stadium], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Stadium id is found.'], 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $stadium = Stadium::find($id);
        if ($stadium) {
            $stadium->delete();
            return response()->json(['success'=> true, 'message'=> 'Delete stadium is successfully.'], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Stadium id is found.'], 404);
    }
}
