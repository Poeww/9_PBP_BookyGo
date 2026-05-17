<?php

namespace App\Http\Controllers;

use App\Models\Ulasan;
use App\Models\Kamar;
use App\Models\Hotel;
use Illuminate\Http\Request;

class UlasanController extends Controller
{
    public function index()
    {
        $ulasans = Ulasan::with(['pemesanan', 'user', 'kamar', 'hotel'])
            ->latest()
            ->get();

        return response()->json([
            'status' => true,
            'message' => 'Data ulasan berhasil diambil',
            'data' => $ulasans
        ]);
    }

    public function show($id)
    {
        $ulasan = Ulasan::with(['pemesanan', 'user', 'kamar', 'hotel'])
            ->find($id);

        if (!$ulasan) {
            return response()->json([
                'status' => false,
                'message' => 'Ulasan tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'message' => 'Detail ulasan berhasil diambil',
            'data' => $ulasan
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'pemesanan_id' => 'required|exists:pemesanans,id|unique:ulasans,pemesanan_id',
            'kamar_id' => 'required|exists:kamars,id',
            'user_id' => 'required|exists:users,id',
            'hotel_id' => 'required|exists:hotels,id',
            'rating' => 'required|numeric|min:1|max:5',
            'komentar' => 'nullable|string|max:255',
        ]);

        $ulasan = Ulasan::create([
            'pemesanan_id' => $request->pemesanan_id,
            'kamar_id' => $request->kamar_id,
            'user_id' => $request->user_id,
            'hotel_id' => $request->hotel_id,
            'rating' => $request->rating,
            'komentar' => $request->komentar,
        ]);

        $this->updateRatingHotel($request->hotel_id);
        $this->updateJumlahUlasanKamar($request->kamar_id);

        return response()->json([
            'status' => true,
            'message' => 'Ulasan berhasil ditambahkan',
            'data' => $ulasan->load(['pemesanan', 'user', 'kamar', 'hotel'])
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $ulasan = Ulasan::find($id);

        if (!$ulasan) {
            return response()->json([
                'status' => false,
                'message' => 'Ulasan tidak ditemukan'
            ], 404);
        }

        $request->validate([
            'pemesanan_id' => 'sometimes|required|exists:pemesanans,id|unique:ulasans,pemesanan_id,' . $ulasan->id,
            'kamar_id' => 'sometimes|required|exists:kamars,id',
            'user_id' => 'sometimes|required|exists:users,id',
            'hotel_id' => 'sometimes|required|exists:hotels,id',
            'rating' => 'sometimes|required|numeric|min:1|max:5',
            'komentar' => 'nullable|string|max:255',
        ]);

        $oldHotelId = $ulasan->hotel_id;
        $oldKamarId = $ulasan->kamar_id;

        $ulasan->update($request->only([
            'pemesanan_id',
            'kamar_id',
            'user_id',
            'hotel_id',
            'rating',
            'komentar',
        ]));

        $this->updateRatingHotel($oldHotelId);
        $this->updateRatingHotel($ulasan->hotel_id);

        $this->updateJumlahUlasanKamar($oldKamarId);
        $this->updateJumlahUlasanKamar($ulasan->kamar_id);

        return response()->json([
            'status' => true,
            'message' => 'Ulasan berhasil diperbarui',
            'data' => $ulasan->load(['pemesanan', 'user', 'kamar', 'hotel'])
        ]);
    }

    public function destroy($id)
    {
        $ulasan = Ulasan::find($id);

        if (!$ulasan) {
            return response()->json([
                'status' => false,
                'message' => 'Ulasan tidak ditemukan'
            ], 404);
        }

        $hotelId = $ulasan->hotel_id;
        $kamarId = $ulasan->kamar_id;

        $ulasan->delete();

        $this->updateRatingHotel($hotelId);
        $this->updateJumlahUlasanKamar($kamarId);

        return response()->json([
            'status' => true,
            'message' => 'Ulasan berhasil dihapus'
        ]);
    }

    private function updateRatingHotel($hotelId)
    {
        $hotel = Hotel::find($hotelId);

        if ($hotel) {
            $hotel->update([
                'total_rating' => Ulasan::where('hotel_id', $hotelId)->avg('rating') ?? 0
            ]);
        }
    }

    private function updateJumlahUlasanKamar($kamarId)
    {
        $kamar = Kamar::find($kamarId);

        if ($kamar) {
            $kamar->update([
                'jumlah_ulasan' => Ulasan::where('kamar_id', $kamarId)->count()
            ]);
        }
    }
}