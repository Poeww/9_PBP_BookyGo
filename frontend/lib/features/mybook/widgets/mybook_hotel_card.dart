import 'package:flutter/material.dart';

class MyBookHotelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String ratingText;

  const MyBookHotelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.ratingText,
  });

  @override
  Widget build(BuildContext context) {
    const darkBlue = Color(0xFF1F2A44);
    const textGrey = Color(0xFF7B88A8);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = screenWidth < 380 ? 172.0 : 182.0;
    final imageHeight = screenWidth < 380 ? 110.0 : 118.0;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              width: cardWidth,
              height: imageHeight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: cardWidth,
                  height: imageHeight,
                  color: const Color(0xFFE9EEFF),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 10, 4, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: screenWidth < 380 ? 14 : 15,
                    fontWeight: FontWeight.w800,
                    color: darkBlue,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  location,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: screenWidth < 380 ? 12 : 13,
                    color: textGrey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ratingText,
                  style: TextStyle(
                    fontSize: screenWidth < 380 ? 12 : 13,
                    color: textGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
