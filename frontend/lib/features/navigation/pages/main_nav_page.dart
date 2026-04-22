import 'package:flutter/material.dart';
import '../../home/pages/home_page.dart';

class MainNavPage extends StatefulWidget {
  final bool isGuest;

  const MainNavPage({
    super.key,
    this.isGuest = true,
  });

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(isGuest: widget.isGuest),
      const Center(child: Text('Booking Page')),
      const Center(child: Text('Wishlist Page')),
      const Center(child: Text('Profile Page')),
    ];
  }

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
        borderRadius: BorderRadius.circular(18),
        onTap: () => _onItemTapped(index),
        child: Center(
          child: Icon(
            icon,
            size: isSelected ? 31 : 29,
            color: isSelected ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5B74E8);

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
          child: Container(
            height: 78,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
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
        ),
      ),
    );
  }
}