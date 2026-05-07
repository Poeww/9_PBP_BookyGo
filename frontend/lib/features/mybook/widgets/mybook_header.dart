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
    return Container(
      color: AppColors.primaryEnd,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 52,
          child: Row(
            children: [
              const SizedBox(width: 20),

              const Text(
                'Your Book',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: onHistoryTap,
                icon: const Icon(
                  Icons.pending_actions_rounded,
                  color: AppColors.white,
                  size: 26,
                ),
              ),

              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}