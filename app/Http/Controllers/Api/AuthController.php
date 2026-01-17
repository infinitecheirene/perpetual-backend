<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    /**
     * Register a new user
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fullName' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'phoneNumber' => 'required|string|max:20',
            'address' => 'required|string|max:500',
            'votersId' => 'required|file|mimes:jpg,jpeg,png,pdf|max:5120', // 5MB max
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            // Handle file upload (save to public path)
            $votersIdPath = null;
            if ($request->hasFile('votersId')) {
                $file = $request->file('votersId');
                $filename = time() . '_' . $file->getClientOriginalName();
                $destination = public_path('voters_ids');
                
                if (!file_exists($destination)) {
                    mkdir($destination, 0777, true);
                }

                $file->move($destination, $filename);
                $votersIdPath = 'voters_ids/' . $filename; // relative path for frontend use
            }

            // Create user
            $user = User::create([
                'name' => $request->fullName,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'phone_number' => $request->phoneNumber,
                'address' => $request->address,
                'voters_id_path' => $votersIdPath,
                'status' => 'pending', // Pending verification
                'role' => 'citizen', // Default role
            ]);

            Log::info('New user registered', [
                'user_id' => $user->id,
                'email' => $user->email,
                'status' => $user->status
            ]);

            // Don't create token during registration since account is pending
            // User must wait for approval before they can login

            return response()->json([
                'success' => true,
                'message' => 'Registration successful! Your account is pending verification. You will be notified via email once approved.',
                'data' => [
                    'user' => [
                        'id' => $user->id,
                        'name' => $user->name,
                        'email' => $user->email,
                        'phone_number' => $user->phone_number,
                        'address' => $user->address,
                        'status' => $user->status,
                    ],
                ]
            ], 201);

        } catch (\Exception $e) {
            Log::error('Registration failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Registration failed',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Login user
     */
   public function login(Request $request)
{
    $validator = Validator::make($request->all(), [
        'email' => 'required|email',
        'password' => 'required|string',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'success' => false,
            'message' => 'Validation error',
            'errors' => $validator->errors()
        ], 422);
    }

    // Find user by email
    $user = User::where('email', $request->email)->first();

    // Check if user exists and password is correct
    if (!$user || !Hash::check($request->password, $user->password)) {
        Log::warning('Failed login attempt', [
            'email' => $request->email,
            'ip' => $request->ip()
        ]);

        return response()->json([
            'success' => false,
            'message' => 'Invalid email or password'
        ], 401);
    }

    // Check if account is deactivated
    if ($user->status === 'deactivated') {
        Log::info('Login attempt with deactivated account', [
            'user_id' => $user->id,
            'email' => $user->email
        ]);

        return response()->json([
            'success' => false,
            'message' => 'Your account has been deactivated.' . 
                        ($user->rejection_reason ? ' Reason: ' . $user->rejection_reason : ' Please contact the administrator for assistance.'),
            'data' => [
                'status' => 'deactivated',
                'reason' => $user->rejection_reason
            ]
        ], 403);
    }

    // Check account status BEFORE creating token
    if ($user->status === 'pending') {
        Log::info('Login attempt with pending account', [
            'user_id' => $user->id,
            'email' => $user->email
        ]);

        return response()->json([
            'success' => false,
            'message' => 'Your account is still pending approval. Please wait for administrator verification.',
            'data' => [
                'status' => 'pending',
                'registered_at' => $user->created_at->diffForHumans(),
            ]
        ], 403);
    }

    if ($user->status === 'rejected') {
        Log::info('Login attempt with rejected account', [
            'user_id' => $user->id,
            'email' => $user->email
        ]);

        return response()->json([
            'success' => false,
            'message' => 'Your account registration was rejected.' . 
                        ($user->rejection_reason ? ' Reason: ' . $user->rejection_reason : ' Please contact the administrator or register again with valid documents.'),
            'data' => [
                'status' => 'rejected',
                'reason' => $user->rejection_reason
            ]
        ], 403);
    }

    // Only approved users can login
    if ($user->status !== 'approved') {
        Log::warning('Login attempt with invalid status', [
            'user_id' => $user->id,
            'email' => $user->email,
            'status' => $user->status
        ]);

        return response()->json([
            'success' => false,
            'message' => 'Your account status is invalid. Please contact the administrator.',
            'data' => [
                'status' => $user->status
            ]
        ], 403);
    }

    // Create token for approved user
    $token = $user->createToken('auth_token')->plainTextToken;

    Log::info('User logged in successfully', [
        'user_id' => $user->id,
        'email' => $user->email,
        'role' => $user->role
    ]);

    // IMPORTANT: Return token at root level for frontend compatibility
    return response()->json([
        'success' => true,
        'message' => 'Login successful',
        'token' => $token, // Token at root level
        'user' => [ // User at root level
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'phone_number' => $user->phone_number,
            'address' => $user->address,
            'status' => $user->status,
            'role' => $user->role,
        ]
    ], 200);
}
    /**
     * Logout user
     */
    public function logout(Request $request)
    {
        try {
            $user = $request->user();
            
            // Delete current access token
            $request->user()->currentAccessToken()->delete();

            Log::info('User logged out', [
                'user_id' => $user->id,
                'email' => $user->email
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Logged out successfully'
            ], 200);

        } catch (\Exception $e) {
            Log::error('Logout failed', [
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Logout failed',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get authenticated user
     */
    public function me(Request $request)
    {
        $user = $request->user();

        return response()->json([
            'success' => true,
            'data' => [
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'phone_number' => $user->phone_number,
                    'address' => $user->address,
                    'status' => $user->status,
                    'role' => $user->role,
                    'voters_id_path' => $user->voters_id_path,
                    'created_at' => $user->created_at,
                    'updated_at' => $user->updated_at,
                ]
            ]
        ], 200);
    }

    /**
     * Refresh token
     */
    public function refresh(Request $request)
    {
        try {
            $user = $request->user();
            
            // Check if user is still approved
            if ($user->status !== 'approved') {
                return response()->json([
                    'success' => false,
                    'message' => 'Account is no longer active',
                ], 403);
            }
            
            // Delete old tokens
            $user->tokens()->delete();
            
            // Create new token
            $token = $user->createToken('auth_token')->plainTextToken;

            Log::info('Token refreshed', [
                'user_id' => $user->id,
                'email' => $user->email
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Token refreshed successfully',
                'data' => [
                    'token' => $token,
                ]
            ], 200);

        } catch (\Exception $e) {
            Log::error('Token refresh failed', [
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Token refresh failed',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}