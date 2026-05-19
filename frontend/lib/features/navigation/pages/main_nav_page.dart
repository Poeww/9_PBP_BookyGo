import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/pages/home_page.dart';
import '../../mybook/pages/mybook_page.dart';
import '../../whistlist/pages/wishlist_page.dart';
import '../../profile/pages/profile_page.dart';

class MainNavPage extends StatefulWidget {
  final bool isGuest;
  final String? userEmail;

  const MainNavPage({
    super.key,
    this.isGuest = true,
    this.userEmail,
  });

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
  }) {
    final bool isSelected = _selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Center(
            child: Icon(
              icon,
              size: isSelected ? 26 : 24,
              color: isSelected
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.92),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        isGuest: widget.isGuest,
        userEmail: widget.userEmail,
      ),
      MyBookPage(
        onBookNowTap: () {
          _onItemTapped(0);
        },
      ),
      const WishlistPage(),
      ProfilePage(isGuest: widget.isGuest),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: SizedBox(
            height: 58,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = constraints.maxWidth / 4;
                final notchCenter = itemWidth * (_selectedIndex + 0.5);

                return ClipPath(
                  clipper: _BottomNavClipper(notchCenter: notchCenter),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryEnd,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.14),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        _buildNavItem(
                          index: 0,
                          icon: Icons.home_rounded,
                        ),
                        _buildNavItem(
                          index: 1,
                          icon: Icons.receipt_long_rounded,
                        ),
                        _buildNavItem(
                          index: 2,
                          icon: Icons.favorite_rounded,
                        ),
                        _buildNavItem(
                          index: 3,
                          icon: Icons.person_rounded,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavClipper extends CustomClipper<Path> {
  final double notchCenter;

  const _BottomNavClipper({
    required this.notchCenter,
  });

  @override
  Path getClip(Size size) {
    const cornerRadius = 14.0;
    const notchRadius = 14.0;
    const notchDepth = 8.0;

    final notchLeft = (notchCenter - notchRadius).clamp(cornerRadius, size.width - cornerRadius);
    final notchRight = (notchCenter + notchRadius).clamp(cornerRadius, size.width - cornerRadius);

    final path = Path()
      ..moveTo(cornerRadius, 0)
      ..lineTo(notchLeft, 0)
      ..quadraticBezierTo(
        notchCenter,
        notchDepth * 2,
        notchRight,
        0,
      )
      ..lineTo(size.width - cornerRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, cornerRadius)
      ..lineTo(size.width, size.height - cornerRadius)
      ..quadraticBezierTo(size.width, size.height, size.width - cornerRadius, size.height)
      ..lineTo(cornerRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - cornerRadius)
      ..lineTo(0, cornerRadius)
      ..quadraticBezierTo(0, 0, cornerRadius, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant _BottomNavClipper oldClipper) {
    return oldClipper.notchCenter != notchCenter;
  }
}
