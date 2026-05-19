import 'package:flutter/material.dart';
import '../widgets/wishlist_empty_state.dart';
import '../widgets/wishlist_header.dart';

class WishlistPage extends StatelessWidget {
  final bool hasWishlistItems;

  const WishlistPage({
    super.key,
    this.hasWishlistItems = false,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF5F8FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const WishlistHeader(),
          Expanded(
            child: hasWishlistItems
                ? const Center(
                    child: Text(
                      'Wishlist items here',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : const WishlistEmptyState(),
          ),
        ],
      ),
    );
  }
}
