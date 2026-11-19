import 'package:flutter/material.dart';
import 'package:tanampedia/core/widgets/main_nav_bar.dart';
import 'package:tanampedia/features/catalog/pages/catalog_page.dart';
import 'package:tanampedia/features/forum/pages/forum_page.dart';
import 'package:tanampedia/features/journal/pages/journal_page.dart';
import 'package:tanampedia/features/quiz/pages/quiz_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    JournalPage(),
    ForumPage(),
    CatalogPage(),
    QuizPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: MainNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
