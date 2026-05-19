import 'package:flutter/material.dart';
import '../widgets/benefit_item.dart';
import '../../navigation/pages/main_nav_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5B74E8);
    const darkBlue = Color(0xFF344A99);
    const backgroundColor = Color(0xFFF5F7FF);
    const textGrey = Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompactHeight = constraints.maxHeight < 760;
            final horizontalPadding = constraints.maxWidth < 380 ? 16.0 : 26.0;
            final verticalPadding = isCompactHeight ? 12.0 : 18.0;
            final bagSize = isCompactHeight ? 74.0 : 110.0;
            final headingSize = isCompactHeight ? 24.0 : 28.0;
            final topGap = isCompactHeight ? 14.0 : 24.0;
            final sectionGap = isCompactHeight ? 22.0 : 34.0;
            final itemGap = isCompactHeight ? 18.0 : 26.0;
            final bottomSectionGap = isCompactHeight ? 26.0 : 40.0;
            final buttonHeight = isCompactHeight ? 54.0 : 58.0;
            final legalTopGap = isCompactHeight ? 16.0 : 22.0;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (verticalPadding * 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MainNavPage(isGuest: true),
                                ),
                              );
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: topGap),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/onboarding_bag.png',
                            width: bagSize,
                            height: bagSize,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: isCompactHeight ? 22.0 : 28.0),
                        Text(
                          'Get more from our app.',
                          style: TextStyle(
                            fontSize: headingSize,
                            fontWeight: FontWeight.w800,
                            color: darkBlue,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: sectionGap),
                        const BenefitItem(
                          icon: Icons.search_rounded,
                          title: 'Smart hotel search.',
                          subtitle: 'Find hotels by name or location.',
                        ),
                        SizedBox(height: itemGap),
                        const BenefitItem(
                          icon: Icons.meeting_room_outlined,
                          title: 'Easy room booking.',
                          subtitle: 'Choose dates, rooms, and add-ons instantly.',
                        ),
                        SizedBox(height: itemGap),
                        const BenefitItem(
                          icon: Icons.receipt_long_outlined,
                          title: 'Digital receipt & QR.',
                          subtitle: 'Get your booking confirmation with QR code.',
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: bottomSectionGap),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: buttonHeight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/Google_G_Logo.png',
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Text(
                                    'Continue with Google',
                                    style: TextStyle(
                                      fontSize: isCompactHeight ? 15 : 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: buttonHeight,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryColor,
                                side: const BorderSide(color: primaryColor, width: 1.6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.mail_outline_rounded, size: 24),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Continue with email',
                                    style: TextStyle(
                                      fontSize: isCompactHeight ? 15 : 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: legalTopGap),
                          const Text.rich(
                            TextSpan(
                              text: 'By signing up you accept our ',
                              style: TextStyle(fontSize: 14, color: textGrey, height: 1.5),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
