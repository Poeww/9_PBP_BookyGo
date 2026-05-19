import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MyBookActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyBookActionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final buttonWidth = (screenWidth * 0.68).clamp(220.0, 290.0);

    return SizedBox(
      width: buttonWidth,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryEnd,
          foregroundColor: AppColors.white,
          elevation: 5,
          shadowColor: Colors.black.withValues(alpha: 0.16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
