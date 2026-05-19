import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/hotel_model.dart';

class HotelCard extends StatelessWidget {
  final HotelModel hotel;
  final VoidCallback onTap;

  const HotelCard({super.key, required this.hotel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 22),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
              child: Container(
                height: 165,
                width: double.infinity,
                color: AppColors.borderLight,
                child: const Icon(
                  Icons.hotel,
                  size: 50,
                  color: AppColors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hotel.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blueSoft),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: AppColors.primaryEnd,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 13,
                        color: AppColors.textMuted,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        hotel.location,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const Icon(
                        Icons.star_half,
                        size: 14,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${hotel.rating} (${hotel.review})',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1),
                  const SizedBox(height: 7),
                  Text(
                    hotel.facilities,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
