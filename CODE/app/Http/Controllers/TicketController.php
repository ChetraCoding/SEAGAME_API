<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreTicketRequest;
use App\Http\Resources\ShowTicketResource;
use App\Models\Schedule;
use App\Models\Stadium;
use App\Models\Ticket;
use App\Models\Zone;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $tickets = Ticket::all();
        $tickets = ShowTicketResource::collection($tickets);
        return response()->json(['success'=> true, 'message'=> 'Get all tickets are successfully.' ,'data'=> $tickets], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTicketRequest $request)
    {
        $stadium = Schedule::find(request('schedule_id'))->stadium;
        $zone = $stadium->zones->find(request('zone_id'));
        if ($zone) {
            $numberOfTickets = Zone::find(request('zone_id'))->numberOfTickets;
            $counTickets = Ticket::where('schedule_id', request('schedule_id'))->where('zone_id', request('zone_id'))->count();
            if ($counTickets < $numberOfTickets) {
                $ticket = Ticket::create([
                    'schedule_id'=> request('schedule_id'),
                    'zone_id'=> request('zone_id'),
                ]);
                return response()->json(['success'=> true, 'message'=> 'Create ticket is successfully.' ,'data'=> $ticket], 200);
            }
            return response()->json(['success'=> false, 'message'=> 'The number of tickets in this zone is full.'], 406);
        }
        return response()->json(['success'=> false, 'message'=> 'The selected zone id in this schedule is invalid.'], 412);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $ticket = Ticket::find($id);
        if ($ticket) {
            $ticket = new ShowTicketResource($ticket);
            return response()->json(['success'=> true, 'message'=> 'Get ticket is successfully.' ,'data'=> $ticket], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Ticket id is not found.'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreTicketRequest $request, $id)
    {
        $ticket = Ticket::find($id);
        if ($ticket) {
            $ticket->update([
                'schedule_id'=> request('schedule_id'),
                'zone_id'=> request('zone_id'),
            ]);
            return response()->json(['success'=> true, 'message'=> 'Update ticket is successfully.' ,'data'=> $ticket], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Ticket id is not found.'], 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $ticket = Ticket::find($id);
        if ($ticket) {
            $ticket->delete();
            return response()->json(['success'=> true, 'message'=> 'Delete ticket is successfully.'], 200);
        }
        return response()->json(['success'=> false, 'message'=> 'Ticket id is not found.'], 404);
    }
}