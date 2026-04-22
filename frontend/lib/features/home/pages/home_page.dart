// Halaman Utama
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool isGuest;

  const HomePage({
    super.key,
    this.isGuest = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            if (isGuest)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Kamu masuk sebagai guest. Login untuk booking, wishlist, dan lihat riwayat.',
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 16),

            const Expanded(
              child: Center(
                child: Text('Homepage'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}