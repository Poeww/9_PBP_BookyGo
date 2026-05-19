import 'package:flutter/material.dart';
import 'package:frontend/features/hotel/pages/hotel_list_page.dart';

import '../../../core/theme/app_colors.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  String formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    final checkInDate = formatDate(today);
    final checkOutDate = formatDate(tomorrow);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 350;
        final horizontalGap = isCompact ? 8.0 : 10.0;

        return Container(
          padding: EdgeInsets.fromLTRB(isCompact ? 14 : 16, 18, isCompact ? 14 : 16, 18),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Your Stay',
                style: TextStyle(
                  fontSize: isCompact ? 17 : 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isCompact ? 10 : 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blueSoft),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: AppColors.textMuted,
                      size: isCompact ? 24 : 28,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Destination',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textMuted,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Bandung, Indonesia',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _InfoBox(
                      icon: Icons.event_available_outlined,
                      title: 'Check-in',
                      value: checkInDate,
                      compact: isCompact,
                    ),
                  ),
                  SizedBox(width: horizontalGap),
                  Expanded(
                    child: _InfoBox(
                      icon: Icons.event_note_outlined,
                      title: 'Check-out',
                      value: checkOutDate,
                      compact: isCompact,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _InfoBox(
                      icon: Icons.bed_rounded,
                      title: 'Room(s)',
                      value: '1 Room',
                      compact: isCompact,
                    ),
                  ),
                  SizedBox(width: horizontalGap),
                  Expanded(
                    child: _InfoBox(
                      icon: Icons.person_rounded,
                      title: 'Guest(s)',
                      value: '2 Guests',
                      compact: isCompact,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: isCompact ? 48 : 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.primaryEnd,
                        AppColors.blueDark,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HotelListPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      'Search Hotel',
                      style: TextStyle(
                        fontSize: isCompact ? 16 : 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool compact;

  const _InfoBox({
    required this.icon,
    required this.title,
    required this.value,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 10,
        vertical: compact ? 12 : 14,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blueSoft),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: compact ? 38 : 42,
            height: compact ? 38 : 42,
            decoration: BoxDecoration(
              color: AppColors.bgVeryLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: AppColors.mutedBlue,
              size: compact ? 20 : 24,
            ),
          ),
          SizedBox(width: compact ? 8 : 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: compact ? 11 : 12,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: compact ? 13 : 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkBlue,
                    height: 1.2,
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
