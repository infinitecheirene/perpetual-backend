<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Announcement extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'title',
        'date',
        'category',
        'description',
        'content',
        'is_active',
        'priority',
    ];

    protected $casts = [
        'date' => 'date',
        'is_active' => 'boolean',
        'priority' => 'integer',
    ];

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopeByCategory($query, $category)
    {
        return $query->where('category', $category);
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('priority', 'desc')
                     ->orderBy('date', 'desc')
                     ->orderBy('created_at', 'desc');
    }
}