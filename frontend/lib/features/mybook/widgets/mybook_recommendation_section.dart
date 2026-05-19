import 'package:flutter/material.dart';
import 'mybook_hotel_card.dart';

class MyBookRecommendationSection extends StatelessWidget {
  const MyBookRecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    const darkBlue = Color(0xFF1F2A44);
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width < 380 ? 14.0 : 20.0;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: width < 380 ? 0 : 4),
      padding: EdgeInsets.fromLTRB(horizontalPadding, 18, horizontalPadding, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your dream vacation waiting you',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: darkBlue,
            ),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: const Row(
              children: [
                _CityChip(label: 'Jakarta', isSelected: true),
                SizedBox(width: 8),
                _CityChip(label: 'Yogyakarta'),
                SizedBox(width: 8),
                _CityChip(label: 'Bali'),
                SizedBox(width: 8),
                _CityChip(label: 'Bandung'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: width < 380 ? 235 : 248,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                MyBookHotelCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?q=80&w=1200&auto=format&fit=crop',
                  title: 'Pine Valley Lodge',
                  location: 'Lembang, Bandung',
                  ratingText: '4,5/5 (4 reviews)',
                ),
                SizedBox(width: 12),
                MyBookHotelCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1510798831971-661eb04b3739?q=80&w=1200&auto=format&fit=crop',
                  title: 'Aurora Hills Resort',
                  location: 'Dago Atas, Bandung',
                  ratingText: '4,7/5 (4 reviews)',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CityChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _CityChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5B74E8);
    const borderColor = Color(0xFF8A96B8);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: isSelected ? primaryColor : borderColor,
          width: 1.4,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: isSelected ? primaryColor : const Color(0xFF4D597A),
        ),
      ),
    );
  }
}
