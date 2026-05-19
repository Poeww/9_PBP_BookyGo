import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 380;

    return Padding(
      padding: EdgeInsets.fromLTRB(isCompact ? 16 : 24, 18, isCompact ? 16 : 24, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Where do you want\nto stay today?',
                style: TextStyle(
                  fontSize: isCompact ? 22 : 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white,
                  height: 1.15,
                ),
              ),
            ),
          ),
          Container(
            width: isCompact ? 44 : 50,
            height: isCompact ? 44 : 50,
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.22),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.white,
              size: isCompact ? 24 : 28,
            ),
          ),
        ],
      ),
    );
  }
}
