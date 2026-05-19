import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/hotel_model.dart';
import '../widgets/hotel_widget.dart';
import 'hotel_detail.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({super.key});

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  final List<HotelModel> hotels = [
    HotelModel(
      name: 'Malioboro Boutique Stay',
      location: 'Malioboro, Yogyakarta',
      rating: '5.0/5',
      review: '100',
      facilities: 'Free Breakfast, Free Parking, Free WiFi',
      description:
          'Hotel nyaman dekat Malioboro dengan desain klasik dan fasilitas lengkap.',
    ),
    HotelModel(
      name: 'Borobudur Heritage Inn',
      location: 'Magelang, Jawa Tengah',
      rating: '4.9/5',
      review: '2,1k',
      facilities: 'Free Breakfast, Free Parking, Free WiFi',
      description:
          'Penginapan elegan dengan nuansa heritage dan pemandangan indah.',
    ),
    HotelModel(
      name: 'Java Royal Retreat',
      location: 'Sleman, Yogyakarta',
      rating: '4.9/5',
      review: '2,1k',
      facilities: 'Free Breakfast, Free Parking, Free WiFi',
      description:
          'Tempat menginap eksklusif dengan suasana tenang dan interior mewah.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isCompact = size.width < 380;

    return Scaffold(
      backgroundColor: AppColors.bgVeryLight,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(isCompact ? 14 : 16, 42, isCompact ? 14 : 16, 14),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryStart,
                  AppColors.primaryEnd,
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back, color: AppColors.white),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Yogyakarta',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '16 March - 18 March • 1 room • 1 guests',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: isCompact ? 10 : 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: AppColors.textMuted),
                      SizedBox(width: 8),
                      Text(
                        'Search hotel',
                        style: TextStyle(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(
                isCompact ? 12 : 16,
                16,
                isCompact ? 12 : 16,
                96,
              ),
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];

                return HotelCard(
                  hotel: hotel,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HotelDetailPage(hotel: hotel),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: SizedBox(
            height: 58,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = constraints.maxWidth / 4;
                final notchCenter = itemWidth * 0.5;

                return ClipPath(
                  clipper: _StaticBottomNavClipper(notchCenter: notchCenter),
                  child: Container(
                    color: AppColors.primaryEnd,
                    child: const Row(
                      children: [
                        _StaticNavItem(
                          icon: Icons.home_rounded,
                          isSelected: true,
                        ),
                        _StaticNavItem(icon: Icons.receipt_long_rounded),
                        _StaticNavItem(icon: Icons.favorite_rounded),
                        _StaticNavItem(icon: Icons.person_rounded),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _StaticNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const _StaticNavItem({
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Center(
          child: Icon(
            icon,
            size: isSelected ? 26 : 24,
            color: isSelected
                ? AppColors.white
                : AppColors.white.withValues(alpha: 0.92),
          ),
        ),
      ),
    );
  }
}

class _StaticBottomNavClipper extends CustomClipper<Path> {
  final double notchCenter;

  const _StaticBottomNavClipper({
    required this.notchCenter,
  });

  @override
  Path getClip(Size size) {
    const cornerRadius = 14.0;
    const notchRadius = 14.0;
    const notchDepth = 8.0;

    final notchLeft =
        (notchCenter - notchRadius).clamp(cornerRadius, size.width - cornerRadius);
    final notchRight =
        (notchCenter + notchRadius).clamp(cornerRadius, size.width - cornerRadius);

    final path = Path()
      ..moveTo(cornerRadius, 0)
      ..lineTo(notchLeft, 0)
      ..quadraticBezierTo(
        notchCenter,
        notchDepth * 2,
        notchRight,
        0,
      )
      ..lineTo(size.width - cornerRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, cornerRadius)
      ..lineTo(size.width, size.height - cornerRadius)
      ..quadraticBezierTo(size.width, size.height, size.width - cornerRadius, size.height)
      ..lineTo(cornerRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - cornerRadius)
      ..lineTo(0, cornerRadius)
      ..quadraticBezierTo(0, 0, cornerRadius, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant _StaticBottomNavClipper oldClipper) {
    return oldClipper.notchCenter != notchCenter;
  }
}
