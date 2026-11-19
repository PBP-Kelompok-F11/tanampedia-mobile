import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';
import 'package:tanampedia/core/themes/font_theme.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: 'Open profile menu',
            icon: const CircleAvatar(
              radius: 18,
              backgroundColor: BaseColors.primary100,
              child: Icon(Icons.person_rounded, color: BaseColors.primary700),
            ),
          ),
          Image.asset('assets/icons/tanampedia-logo.png', height: 46),
          Text(
            "Tanampedia",
            style: FontTheme.headlineMedium.copyWith(
              color: BaseColors.primary800,
            ),
          ),
        ],
      ),
    );
  }
}
