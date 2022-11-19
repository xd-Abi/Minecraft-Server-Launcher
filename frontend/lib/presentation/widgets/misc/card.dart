import 'package:flutter/material.dart';

import '../utility/theme_builder.dart';

class AppCard extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final Widget child;

  const AppCard({
    Key? key,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (theme) => Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: theme.bg2,
        ),
        child: child,
      ),
    );
  }
}
