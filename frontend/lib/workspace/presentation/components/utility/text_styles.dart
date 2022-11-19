import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

class Fonts {
  static const String quicksand = 'Quicksand';
}

class FontSizes {
  FontSizes._();

  static double get scale => 1.0;

  static double get small => 20 * scale;

  static double get regular => 22 * scale;

  static double get medium => 24 * scale;

  static double get large => 32 * scale;
}

class TextStyles {
  TextStyles._();

  static const TextStyle quicksand = TextStyle(
    fontFamily: Fonts.quicksand,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get h1 =>
      quicksand.weight(FontWeight.w600).size(FontSizes.large);

  static TextStyle get h2 =>
      quicksand.weight(FontWeight.w500).size(FontSizes.medium);

  static TextStyle get regular =>
      quicksand.weight(FontWeight.w300).size(FontSizes.regular);

  static TextStyle get small =>
      quicksand.weight(FontWeight.w300).size(FontSizes.small);

  static TextStyle get button =>
      quicksand.bold.size(FontSizes.regular).letterSpace(1.75);
}
