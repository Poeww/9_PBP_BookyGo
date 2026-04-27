import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5B74E8);

    return Container(
      width: double.infinity,
      color: primaryColor,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: const SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}