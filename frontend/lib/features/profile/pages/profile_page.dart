import 'package:flutter/material.dart';
import '../../onboarding/pages/welcome_page.dart';
import '../widgets/profile_guest_card.dart';
import '../widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  final bool isGuest;

  const ProfilePage({
    super.key,
    this.isGuest = true,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF4F7FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: isGuest
                ? ProfileGuestCard(
                    onSignInPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WelcomePage(),
                        ),
                        (route) => false,
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'Profile logged in',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}