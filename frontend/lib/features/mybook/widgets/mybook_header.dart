import 'package:flutter/material.dart';

class MyBookHeader extends StatelessWidget {
  final VoidCallback onHistoryTap;

  const MyBookHeader({
    super.key,
    required this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5B74E8);

    return Container(
      width: double.infinity,
      color: primaryColor,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Your Book',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            IconButton(
              onPressed: onHistoryTap,
              icon: const Icon(
                Icons.pending_actions_rounded,
                color: Colors.white,
                size: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}