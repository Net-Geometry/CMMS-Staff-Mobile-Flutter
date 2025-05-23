import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  static const _green = Color(0xFF00A572);
  static const _grey = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70, // Reduced height to avoid overflow
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(icon: Icons.home, label: "Home", index: 0),
              _buildNavItem(
                icon: Icons.calendar_today,
                label: "Leave",
                index: 1,
              ),
              // Spacer for center button
              const SizedBox(width: 60),
              _buildNavItem(
                icon: Icons.account_balance_wallet,
                label: "Payroll",
                index: 3,
              ),
              _buildNavItem(
                icon: Icons.calendar_month,
                label: "Schedule",
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? _green : _grey;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              Container(
                height: 4,
                width: 24,
                decoration: BoxDecoration(
                  color: _green,
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            else
              const SizedBox(height: 4),
            const SizedBox(height: 4),
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // Using FloatingActionButton pattern instead
  static Widget buildFloatingActionButton(
    BuildContext context,
    int selectedIndex,
    Function(int) onTabSelected,
  ) {
    final isSelected = selectedIndex == 2;
    final labelColor = isSelected ? _green : _grey;

    return Transform.translate(
      offset: const Offset(0, 15), // Move down by 15 pixels
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(
              bottom: 6,
            ), // Increased spacing for the text below
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: FloatingActionButton(
              elevation: 0, // Remove default FloatingActionButton shadow
              onPressed: () => onTabSelected(2),
              backgroundColor: _green,
              shape: const CircleBorder(), // Ensure perfect circle shape
              child: const Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              "Attendance",
              style: TextStyle(color: labelColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
