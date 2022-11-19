import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appearance.freezed.dart';

@freezed
class Appearance with _$Appearance {
  const factory Appearance({required AppTheme theme}) = _Appearance;
}

class AppTheme {
  final Color bg1;
  final Color bg2;
  final Color bg3;
  final Color text1;
  final Color text2;
  final Color text3;
  final Color primary;
  final Color error;

  final Brightness brightness;

  AppTheme(
      {required this.bg1,
      required this.bg2,
      required this.bg3,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.primary,
      required this.brightness,
      required this.error});

  factory AppTheme.light() {
    return AppTheme(
      bg1: const Color(0xFFFFFFFF),
      bg2: const Color(0xFFE5F0F4),
      bg3: const Color(0xFFDDE5E9),
      text1: const Color(0xFF000000),
      text2: const Color(0xFF222324),
      text3: const Color(0xFF383C3E),
      primary: const Color(0xFF3F8DFD),
      error: const Color(0xFFFF4A4A),
      brightness: Brightness.light,
    );
  }

  factory AppTheme.dark() {
    return AppTheme(
      bg1: const Color(0xFF0F1010),
      bg2: const Color(0xFF161819),
      bg3: const Color(0xFF1C1E1F),
      text1: const Color(0xFFFFFFFF),
      text2: const Color(0xFFDDE7EB),
      text3: const Color(0xFFC1CCD0),
      primary: const Color(0xFF3F8DFD),
      error: const Color(0xFFFF4A4A),
      brightness: Brightness.dark,
    );
  }

  factory AppTheme.fromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? AppTheme.dark() : AppTheme.light();
  }

  ThemeData toThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: bg1,
      primaryColor: primary,
      splashColor: primary.withOpacity(0.15),
      hoverColor: primary.withOpacity(0.15),
      highlightColor: primary.withOpacity(0.15),
    );
  }
}
