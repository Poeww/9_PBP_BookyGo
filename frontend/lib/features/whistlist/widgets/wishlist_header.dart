import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class WishlistHeader extends StatelessWidget {
  const WishlistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      color: AppColors.white,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width < 380 ? 16 : 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Wishlist',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
