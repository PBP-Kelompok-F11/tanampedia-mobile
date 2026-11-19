import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/app_theme.dart';
import 'package:tanampedia/core/widgets/home_shell.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeShell(),
    );
  }
}
