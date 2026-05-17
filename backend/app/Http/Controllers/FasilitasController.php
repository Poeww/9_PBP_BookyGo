<?php

namespace App\Http\Controllers;

use App\Models\Fasilitas;
use Illuminate\Http\Request;

class FasilitasController extends Controller
{
    public function index()
    {
        $fasilitas = Fasilitas::latest()->get();

        return response()->json([
            'status' => true,
            'message' => 'Data fasilitas berhasil diambil',
            'data' => $fasilitas
        ]);
    }

    public function show($id)
    {
        $fasilitas = Fasilitas::find($id);

        if (!$fasilitas) {
            return response()->json([
                'status' => false,
                'message' => 'Fasilitas tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'message' => 'Detail fasilitas berhasil diambil',
            'data' => $fasilitas
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required|string|max:255',
        ]);

        $fasilitas = Fasilitas::create([
            'nama' => $request->nama,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Fasilitas berhasil ditambahkan',
            'data' => $fasilitas
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $fasilitas = Fasilitas::find($id);

        if (!$fasilitas) {
            return response()->json([
                'status' => false,
                'message' => 'Fasilitas tidak ditemukan'
            ], 404);
        }

        $request->validate([
            'nama' => 'required|string|max:255',
        ]);

        $fasilitas->update([
            'nama' => $request->nama,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Fasilitas berhasil diperbarui',
            'data' => $fasilitas
        ]);
    }

    public function destroy($id)
    {
        $fasilitas = Fasilitas::find($id);

        if (!$fasilitas) {
            return response()->json([
                'status' => false,
                'message' => 'Fasilitas tidak ditemukan'
            ], 404);
        }

        $fasilitas->delete();

        return response()->json([
            'status' => true,
            'message' => 'Fasilitas berhasil dihapus'
        ]);
    }
}