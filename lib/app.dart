import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
