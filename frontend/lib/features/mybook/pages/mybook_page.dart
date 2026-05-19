import 'package:flutter/material.dart';
import '../widgets/mybook_action_button.dart';
import '../widgets/mybook_header.dart';
import '../widgets/mybook_recommendation_section.dart';
import '../../history/pages/history_page.dart';
import '../../../core/theme/app_colors.dart';

class MyBookPage extends StatelessWidget {
  final VoidCallback onBookNowTap;

  const MyBookPage({
    super.key,
    required this.onBookNowTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isCompact = screenSize.width < 380;

    return Scaffold(
      backgroundColor: AppColors.bgVeryLight,
      body: Column(
        children: [
          MyBookHeader(
            onHistoryTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryPage(
                    histories: [
                      {
                        'id': 'XXXXX',
                        'hotelName': 'Malioboro Boutique Stay',
                        'location': 'Yogyakarta, Indonesia',
                        'imagePath': 'assets/images/onboarding_bag.png',
                        'dateRange': '16 March – 18 March, 2026',
                        'night': '2 Night',
                        'status': 'completed',
                        'hasReview': false,
                      },
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                children: [
                  SizedBox(height: isCompact ? 28 : 34),

                  Image.asset(
                    'assets/images/no_active_order.png',
                    width: isCompact ? 150 : 178,
                    height: isCompact ? 132 : 156,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'No active orders',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 22),

                  MyBookActionButton(
                    text: 'Book now',
                    onPressed: onBookNowTap,
                  ),

                  SizedBox(height: isCompact ? 44 : 52),

                  const MyBookRecommendationSection(),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
