<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Schedule extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'date',
        'description',
        'sport_id',
        'stadium_id'
    ];

    public function stadium(): BelongsTo
    {
        return $this->BelongsTo(Stadium::class);
    }

    public function sport(): BelongsTo
    {
        return $this->BelongsTo(Sport::class);
    }

    public function competitions(): HasMany
    {
        return $this->hasMany(Competition::class);
    }
    
    public function tickets(): HasMany
    {
        return $this->hasMany(Ticket::class);
    }
}
