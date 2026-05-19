import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MyBookHeader extends StatelessWidget {
  final VoidCallback onHistoryTap;

  const MyBookHeader({
    super.key,
    required this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      color: AppColors.white,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              SizedBox(width: width < 380 ? 16 : 20),

              const Text(
                'Your Book',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: onHistoryTap,
                icon: const Icon(
                  Icons.pending_actions_rounded,
                  color: AppColors.primaryEnd,
                  size: 24,
                ),
              ),

              SizedBox(width: width < 380 ? 6 : 8),
            ],
          ),
        ),
      ),
    );
  }
}
