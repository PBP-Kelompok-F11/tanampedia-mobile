import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';
import 'package:tanampedia/features/auth/pages/auth_page.dart';
import 'package:tanampedia/features/leaderboard/pages/leaderboard_page.dart';
import 'package:tanampedia/features/profile/pages/profile_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: BaseColors.raised,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            ListTile(
              leading: const Icon(Icons.leaderboard_rounded),
              title: const Text('Leaderboard'),
              onTap: () => _navigate(context, const LeaderboardPage()),
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text('Profile'),
              onTap: () => _navigate(context, const ProfilePage()),
            ),
            ListTile(
              leading: const Icon(Icons.login_rounded),
              title: const Text('Auth'),
              onTap: () => _navigate(context, const AuthPage()),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(BuildContext context, Widget page) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}
