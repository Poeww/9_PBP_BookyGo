import 'package:flutter/material.dart';

class ProfileGuestCard extends StatelessWidget {
  final VoidCallback onSignInPressed;

  const ProfileGuestCard({
    super.key,
    required this.onSignInPressed,
  });

  @override
  Widget build(BuildContext context) {
    const darkBlue = Color(0xFF344A99);
    const textGrey = Color(0xFF6B7280);
    const primaryColor = Color(0xFF5B74E8);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 54),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboarding_bag.png',
                width: 86,
                height: 86,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 18),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Want to book faster?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: darkBlue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Save your favorite hotels and\nmanage your stays, just sign in.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 42),

          SizedBox(
            width: double.infinity,
            height: 58,
            child: OutlinedButton(
              onPressed: onSignInPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: primaryColor,
                side: const BorderSide(
                  color: primaryColor,
                  width: 1.4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.white.withValues(alpha: 0.35),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}