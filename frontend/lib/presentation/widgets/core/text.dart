import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../utility/text_styles.dart';
import '../utility/theme_builder.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;

  const AppText(
    this.text, {
    Key? key,
    required this.style,
    this.color,
  }) : super(key: key);

  factory AppText.h1(String text, {Color? color}) =>
      AppText(text, style: TextStyles.h1, color: color);

  factory AppText.h2(String text, {Color? color}) =>
      AppText(text, style: TextStyles.h2, color: color);

  factory AppText.regular(String text) =>
      AppText(text, style: TextStyles.regular);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (theme) => Text(
        text,
        style: style.textColor(color ?? theme.text1),
      ),
    );
  }
}
