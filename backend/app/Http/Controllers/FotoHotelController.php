<?php

namespace App\Http\Controllers;

use App\Models\FotoHotel;
use Illuminate\Http\Request;

class FotoHotelController extends Controller
{
    public function index()
    {
        $fotoHotels = FotoHotel::with('hotel')
            ->orderBy('urutan')
            ->get();

        return response()->json([
            'status' => true,
            'message' => 'Data foto hotel berhasil diambil',
            'data' => $fotoHotels
        ]);
    }

    public function show($id)
    {
        $fotoHotel = FotoHotel::with('hotel')->find($id);

        if (!$fotoHotel) {
            return response()->json([
                'status' => false,
                'message' => 'Foto hotel tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'message' => 'Detail foto hotel berhasil diambil',
            'data' => $fotoHotel
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'hotel_id' => 'required|exists:hotels,id',
            'path' => 'required|string|max:255',
            'urutan' => 'nullable|integer|min:1',
        ]);

        $fotoHotel = FotoHotel::create([
            'hotel_id' => $request->hotel_id,
            'path' => $request->path,
            'urutan' => $request->urutan ?? 1,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Foto hotel berhasil ditambahkan',
            'data' => $fotoHotel->load('hotel')
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $fotoHotel = FotoHotel::find($id);

        if (!$fotoHotel) {
            return response()->json([
                'status' => false,
                'message' => 'Foto hotel tidak ditemukan'
            ], 404);
        }

        $request->validate([
            'hotel_id' => 'sometimes|required|exists:hotels,id',
            'path' => 'sometimes|required|string|max:255',
            'urutan' => 'nullable|integer|min:1',
        ]);

        $fotoHotel->update($request->only([
            'hotel_id',
            'path',
            'urutan',
        ]));

        return response()->json([
            'status' => true,
            'message' => 'Foto hotel berhasil diperbarui',
            'data' => $fotoHotel->load('hotel')
        ]);
    }

    public function destroy($id)
    {
        $fotoHotel = FotoHotel::find($id);

        if (!$fotoHotel) {
            return response()->json([
                'status' => false,
                'message' => 'Foto hotel tidak ditemukan'
            ], 404);
        }

        $fotoHotel->delete();

        return response()->json([
            'status' => true,
            'message' => 'Foto hotel berhasil dihapus'
        ]);
    }
}