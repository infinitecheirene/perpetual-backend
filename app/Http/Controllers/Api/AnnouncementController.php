<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Announcement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AnnouncementController extends Controller
{
    /**
     * Check if user is admin
     */
    private function isAdmin(Request $request): bool
    {
        return $request->user() && 
               ($request->user()->is_admin === true || 
                $request->user()->role === 'admin');
    }

    /**
     * Display a listing of announcements (Public & Admin)
     */
    public function index(Request $request)
    {
        $query = Announcement::query();

        // For public API, only show active announcements
        if (!$this->isAdmin($request)) {
            $query->active();
        }

        // Filter by category
        if ($request->has('category') && $request->input('category') !== 'all') {
            $query->byCategory($request->input('category'));
        }

        // Search
        if ($request->has('search') && $request->input('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('title', 'LIKE', "%{$search}%")
                  ->orWhere('description', 'LIKE', "%{$search}%")
                  ->orWhere('content', 'LIKE', "%{$search}%");
            });
        }

        // Filter by active status (admin only)
        if ($this->isAdmin($request) && $request->has('is_active')) {
            $query->where('is_active', $request->boolean('is_active'));
        }

        // Order announcements
        $query->ordered();

        // Paginate
        $perPage = $request->input('per_page', 15);
        $announcements = $query->paginate($perPage);

        return response()->json([
            'success' => true,
            'data' => $announcements,
        ]);
    }

    /**
     * Store a newly created announcement
     */
    public function store(Request $request)
    {
        // Check if user is admin
        if (!$this->isAdmin($request)) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized. Admin access required.',
            ], 403);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'date' => 'required|date',
            'category' => 'required|in:Update,Event,Alert,Development,Health,Notice',
            'description' => 'required|string|max:500',
            'content' => 'required|string',
            'is_active' => 'boolean',
            'priority' => 'integer|min:0|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed.',
                'errors' => $validator->errors(),
            ], 422);
        }

        $announcement = Announcement::create([
            'title' => $request->input('title'),
            'date' => $request->input('date'),
            'category' => $request->input('category'),
            'description' => $request->input('description'),
            'content' => $request->input('content'),
            'is_active' => $request->input('is_active', true),
            'priority' => $request->input('priority', 0),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Announcement created successfully.',
            'data' => $announcement,
        ], 201);
    }

    /**
     * Display the specified announcement
     */
    public function show(Request $request, $id)
    {
        $announcement = Announcement::find($id);

        if (!$announcement) {
            return response()->json([
                'success' => false,
                'message' => 'Announcement not found.',
            ], 404);
        }

        // Check if announcement is active for non-admin users
        if (!$this->isAdmin($request) && !$announcement->is_active) {
            return response()->json([
                'success' => false,
                'message' => 'Announcement not found.',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $announcement,
        ]);
    }

    /**
     * Update the specified announcement
     */
    public function update(Request $request, $id)
    {
        // Check if user is admin
        if (!$this->isAdmin($request)) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized. Admin access required.',
            ], 403);
        }

        $announcement = Announcement::find($id);

        if (!$announcement) {
            return response()->json([
                'success' => false,
                'message' => 'Announcement not found.',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'sometimes|string|max:255',
            'date' => 'sometimes|date',
            'category' => 'sometimes|in:Update,Event,Alert,Development,Health,Notice',
            'description' => 'sometimes|string|max:500',
            'content' => 'sometimes|string',
            'is_active' => 'boolean',
            'priority' => 'integer|min:0|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed.',
                'errors' => $validator->errors(),
            ], 422);
        }

        $announcement->update($request->only([
            'title',
            'date',
            'category',
            'description',
            'content',
            'is_active',
            'priority',
        ]));

        return response()->json([
            'success' => true,
            'message' => 'Announcement updated successfully.',
            'data' => $announcement,
        ]);
    }

    /**
     * Remove the specified announcement
     */
    public function destroy(Request $request, $id)
    {
        // Check if user is admin
        if (!$this->isAdmin($request)) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized. Admin access required.',
            ], 403);
        }

        $announcement = Announcement::find($id);

        if (!$announcement) {
            return response()->json([
                'success' => false,
                'message' => 'Announcement not found.',
            ], 404);
        }

        $announcement->delete();

        return response()->json([
            'success' => true,
            'message' => 'Announcement deleted successfully.',
        ]);
    }

    /**
     * Toggle announcement active status
     */
    public function toggleActive(Request $request, $id)
    {
        // Check if user is admin
        if (!$this->isAdmin($request)) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized. Admin access required.',
            ], 403);
        }

        $announcement = Announcement::find($id);

        if (!$announcement) {
            return response()->json([
                'success' => false,
                'message' => 'Announcement not found.',
            ], 404);
        }

        $announcement->is_active = !$announcement->is_active;
        $announcement->save();

        return response()->json([
            'success' => true,
            'message' => 'Announcement status updated successfully.',
            'data' => $announcement,
        ]);
    }
}