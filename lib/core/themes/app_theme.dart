import 'package:flutter/material.dart';
import 'package:tanampedia/core/themes/base_colors.dart';
import 'package:tanampedia/core/themes/font_theme.dart';

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: BaseColors.surface,
      colorScheme: ColorScheme.fromSeed(
        seedColor: BaseColors.primary,
        brightness: Brightness.light,
        primary: BaseColors.primary,
        error: BaseColors.error,
        surface: BaseColors.raised,
      ),
      textTheme: FontTheme.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: BaseColors.raised,
        foregroundColor: BaseColors.textPrimary,
        elevation: 0,
        titleTextStyle: FontTheme.titleLarge.copyWith(
          color: BaseColors.textPrimary,
        ),
      ),
    );
  }
}
