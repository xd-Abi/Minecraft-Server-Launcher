import 'package:flutter/material.dart';

import '../prelude.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (theme) => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: -3,
              blurRadius: 20,
              color: theme.primary.withOpacity(0.3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(theme.primary),
          ),
          child: child,
        ),
      ),
    );
  }
}
