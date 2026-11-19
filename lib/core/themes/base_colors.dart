import 'package:flutter/material.dart';

abstract final class BaseColors {
  // Primary (Green)
  static const Color primary900 = Color(0xFF0B2B1C);
  static const Color primary800 = Color(0xFF123D27);
  static const Color primary700 = Color(0xFF1C5632);
  static const Color primary600 = Color(0xFF276E3E);
  static const Color primary500 = Color(0xFF34A853);
  static const Color primary400 = Color(0xFF5CC077);
  static const Color primary300 = Color(0xFF8ED8A3);
  static const Color primary200 = Color(0xFFC3ECCE);
  static const Color primary100 = Color(0xFFE3F6E8);
  static const Color primary50 = Color(0xFFF2FBF4);
  static const Color primary = primary500;

  // Grey
  static const Color grey900 = Color(0xFF0F172A);
  static const Color grey800 = Color(0xFF1E293B);
  static const Color grey700 = Color(0xFF334155);
  static const Color grey600 = Color(0xFF475569);
  static const Color grey500 = Color(0xFF64748B);
  static const Color grey400 = Color(0xFF94A3B8);
  static const Color grey300 = Color(0xFFCBD5E1);
  static const Color grey200 = Color(0xFFE2E8F0);
  static const Color grey100 = Color(0xFFF1F5F9);
  static const Color grey50 = Color(0xFFF8FAFC);

  // Red / Danger
  static const Color red900 = Color(0xFF7F1D1D);
  static const Color red800 = Color(0xFF991B1B);
  static const Color red700 = Color(0xFFB91C1C);
  static const Color red600 = Color(0xFFDC2626);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red400 = Color(0xFFF87171);
  static const Color red300 = Color(0xFFFCA5A5);
  static const Color red200 = Color(0xFFFECACA);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red50 = Color(0xFFFEF2F2);

  // Blue / Info
  static const Color blue900 = Color(0xFF1E3A8A);
  static const Color blue800 = Color(0xFF1E40AF);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color blue400 = Color(0xFF60A5FA);
  static const Color blue300 = Color(0xFF93C5FD);
  static const Color blue200 = Color(0xFFBFDBFE);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color blue50 = Color(0xFFEFF6FF);

  // Black / white alpha scales
  static const Color black100 = Color.fromRGBO(0, 0, 0, 1);
  static const Color black90 = Color.fromRGBO(0, 0, 0, 0.9);
  static const Color black80 = Color.fromRGBO(0, 0, 0, 0.8);
  static const Color black70 = Color.fromRGBO(0, 0, 0, 0.7);
  static const Color black60 = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color black50 = Color.fromRGBO(0, 0, 0, 0.5);
  static const Color black40 = Color.fromRGBO(0, 0, 0, 0.4);
  static const Color black30 = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color black20 = Color.fromRGBO(0, 0, 0, 0.2);
  static const Color black10 = Color.fromRGBO(0, 0, 0, 0.1);

  static const Color white100 = Color.fromRGBO(255, 255, 255, 1);
  static const Color white90 = Color.fromRGBO(255, 255, 255, 0.9);
  static const Color white80 = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color white70 = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color white60 = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color white50 = Color.fromRGBO(255, 255, 255, 0.5);
  static const Color white40 = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color white30 = Color.fromRGBO(255, 255, 255, 0.3);
  static const Color white20 = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color white10 = Color.fromRGBO(255, 255, 255, 0.1);

  // Surfaces (light mode)
  static const Color surface = primary50;
  static const Color raised = white100;
  static const Color sunken = primary100;
  static const Color border = grey200;

  // Semantic text
  static const Color textPrimary = grey900;
  static const Color textSecondary = grey500;
  static const Color textDisabled = grey400;

  // Semantic status
  static const Color success = primary500;
  static const Color error = red500;
  static const Color errorLight = red100;
  static const Color info = blue500;
  static const Color infoLight = blue100;
}
