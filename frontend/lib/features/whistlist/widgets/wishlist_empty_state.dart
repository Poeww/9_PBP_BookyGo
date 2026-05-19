import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class WishlistEmptyState extends StatelessWidget {
  const WishlistEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isCompact = size.width < 380 || size.height < 760;
    final horizontalPadding = isCompact ? 16.0 : 28.0;
    final imageWidth = isCompact ? 158.0 : 190.0;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, isCompact ? 22 : 32, horizontalPadding, 120),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height - (isCompact ? 170 : 190),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/wishlist_empty.png',
              width: imageWidth,
              fit: BoxFit.contain,
            ),
            SizedBox(height: isCompact ? 22 : 28),
            const Text(
              'Your favorite stays, all in one place.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.darkBlue,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Keep hotels you like and plan your next booking easily.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textMuted,
                height: 1.45,
              ),
            ),
            SizedBox(height: isCompact ? 64 : 82),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryEnd,
                  foregroundColor: AppColors.white,
                  elevation: 5,
                  shadowColor: Colors.black.withValues(alpha: 0.14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
