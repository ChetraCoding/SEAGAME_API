<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ShowScheduleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'schedule_id' =>$this->id,
            'name' =>$this->name,
            'date' =>$this->date,
            'description'=> $this->description,
            'sport_type' =>$this->sport->type ?? null,
            'stadium_name' =>$this->stadium->name ?? null,
            'stadium_address' =>$this->stadium->address ?? null,
            'competitions' => ShowCompetitionResource::collection($this->competitions),
        ];
    }
}
