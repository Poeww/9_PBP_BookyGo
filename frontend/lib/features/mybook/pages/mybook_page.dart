import 'package:flutter/material.dart';
import '../widgets/mybook_action_button.dart';
import '../widgets/mybook_header.dart';
import '../widgets/mybook_recommendation_section.dart';
import '../../history/pages/history_page.dart';

class MyBookPage extends StatelessWidget {
  final VoidCallback onBookNowTap;

  const MyBookPage({
    super.key,
    required this.onBookNowTap,
  });
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF4F7FF);
    const darkBlue = Color(0xFF1F2A44);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          MyBookHeader(
            onHistoryTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryPage(
                    histories: [], //inii nanti kalo mau nampilin contoh card nya masukin data dummy aja
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
                  const SizedBox(height: 40),

                  Image.asset(
                    'assets/images/onboarding_bag.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'No active orders',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: darkBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  MyBookActionButton(
                    text: 'Book now',
                    onPressed: onBookNowTap,
                  ),

                  const SizedBox(height: 56),

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