import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<IconData> _icons = [
    Icons.menu_book_rounded,
    Icons.forum_rounded,
    Icons.grid_view_rounded,
    Icons.quiz_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      onTap: onTap,
      color: BaseColors.primary,
      buttonBackgroundColor: BaseColors.primary600,
      backgroundColor: BaseColors.surface,
      animationDuration: const Duration(milliseconds: 300),
      items: _icons
          .map((icon) => Icon(icon, color: BaseColors.white100))
          .toList(),
    );
  }
}
