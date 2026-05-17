<?php

namespace App\Http\Controllers;

use App\Models\Wishlist;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    public function index()
    {
        $wishlists = Wishlist::with(['user', 'hotel.fotoHotels'])
            ->latest()
            ->get();

        return response()->json([
            'status' => true,
            'message' => 'Data wishlist berhasil diambil',
            'data' => $wishlists
        ]);
    }

    public function show($id)
    {
        $wishlist = Wishlist::with(['user', 'hotel.fotoHotels'])
            ->find($id);

        if (!$wishlist) {
            return response()->json([
                'status' => false,
                'message' => 'Wishlist tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'message' => 'Detail wishlist berhasil diambil',
            'data' => $wishlist
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'hotel_id' => 'required|exists:hotels,id',
        ]);

        $exists = Wishlist::where('user_id', $request->user_id)
            ->where('hotel_id', $request->hotel_id)
            ->first();

        if ($exists) {
            return response()->json([
                'status' => false,
                'message' => 'Hotel sudah ada di wishlist'
            ], 409);
        }

        $wishlist = Wishlist::create([
            'user_id' => $request->user_id,
            'hotel_id' => $request->hotel_id,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Wishlist berhasil ditambahkan',
            'data' => $wishlist->load(['user', 'hotel'])
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $wishlist = Wishlist::find($id);

        if (!$wishlist) {
            return response()->json([
                'status' => false,
                'message' => 'Wishlist tidak ditemukan'
            ], 404);
        }

        $request->validate([
            'user_id' => 'sometimes|required|exists:users,id',
            'hotel_id' => 'sometimes|required|exists:hotels,id',
        ]);

        $userId = $request->user_id ?? $wishlist->user_id;
        $hotelId = $request->hotel_id ?? $wishlist->hotel_id;

        $exists = Wishlist::where('user_id', $userId)
            ->where('hotel_id', $hotelId)
            ->where('id', '!=', $wishlist->id)
            ->first();

        if ($exists) {
            return response()->json([
                'status' => false,
                'message' => 'Hotel sudah ada di wishlist'
            ], 409);
        }

        $wishlist->update([
            'user_id' => $userId,
            'hotel_id' => $hotelId,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Wishlist berhasil diperbarui',
            'data' => $wishlist->load(['user', 'hotel'])
        ]);
    }

    public function destroy($id)
    {
        $wishlist = Wishlist::find($id);

        if (!$wishlist) {
            return response()->json([
                'status' => false,
                'message' => 'Wishlist tidak ditemukan'
            ], 404);
        }

        $wishlist->delete();

        return response()->json([
            'status' => true,
            'message' => 'Wishlist berhasil dihapus'
        ]);
    }
}