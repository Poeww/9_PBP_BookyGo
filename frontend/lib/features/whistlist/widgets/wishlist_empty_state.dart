import 'package:flutter/material.dart';

class WishlistEmptyState extends StatelessWidget {
  const WishlistEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    const darkBlue = Color(0xFF1F2A44);
    const textGrey = Color(0xFF5F6B85);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/onboarding_bag.png',
            width: 170,
            height: 170,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 22),
          const Text(
            'Your wishlist is empty',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: darkBlue,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Save hotels you like to your wishlist so you can',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: textGrey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'find them easily later.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: textGrey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}