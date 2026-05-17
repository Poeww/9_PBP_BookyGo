<?php

namespace App\Http\Controllers;

use App\Models\FotoKamar;
use Illuminate\Http\Request;

class FotoKamarController extends Controller
{
    public function index()
    {
        $fotoKamars = FotoKamar::with('kamar')
            ->orderBy('urutan')
            ->get();

        return response()->json([
            'status' => true,
            'message' => 'Data foto kamar berhasil diambil',
            'data' => $fotoKamars
        ]);
    }

    public function show($id)
    {
        $fotoKamar = FotoKamar::with('kamar')->find($id);

        if (!$fotoKamar) {
            return response()->json([
                'status' => false,
                'message' => 'Foto kamar tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'message' => 'Detail foto kamar berhasil diambil',
            'data' => $fotoKamar
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'kamar_id' => 'required|exists:kamars,id',
            'path' => 'required|string|max:255',
            'urutan' => 'nullable|integer|min:1',
        ]);

        $fotoKamar = FotoKamar::create([
            'kamar_id' => $request->kamar_id,
            'path' => $request->path,
            'urutan' => $request->urutan ?? 1,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Foto kamar berhasil ditambahkan',
            'data' => $fotoKamar->load('kamar')
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $fotoKamar = FotoKamar::find($id);

        if (!$fotoKamar) {
            return response()->json([
                'status' => false,
                'message' => 'Foto kamar tidak ditemukan'
            ], 404);
        }

        $request->validate([
            'kamar_id' => 'sometimes|required|exists:kamars,id',
            'path' => 'sometimes|required|string|max:255',
            'urutan' => 'nullable|integer|min:1',
        ]);

        $fotoKamar->update($request->only([
            'kamar_id',
            'path',
            'urutan',
        ]));

        return response()->json([
            'status' => true,
            'message' => 'Foto kamar berhasil diperbarui',
            'data' => $fotoKamar->load('kamar')
        ]);
    }

    public function destroy($id)
    {
        $fotoKamar = FotoKamar::find($id);

        if (!$fotoKamar) {
            return response()->json([
                'status' => false,
                'message' => 'Foto kamar tidak ditemukan'
            ], 404);
        }

        $fotoKamar->delete();

        return response()->json([
            'status' => true,
            'message' => 'Foto kamar berhasil dihapus'
        ]);
    }
}