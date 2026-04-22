import 'package:flutter/material.dart';
import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  final bool isGuest;

  const HomePage({
    super.key,
    this.isGuest = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const HomeHeader(),

                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: -90,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find Your Stay',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF344A99),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text('Isi form search hotel di sini'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 110),

              if (isGuest)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7E8),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFFFC857),
                    ),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, color: Colors.black87),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Kamu masuk sebagai guest. Login untuk booking, wishlist, dan lihat riwayat.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 24),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular Destinations',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF344A99),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 400),
            ],
          ),
        ),
      ),
    );
  }
}