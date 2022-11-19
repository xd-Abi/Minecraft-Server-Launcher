import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../../application/prelude.dart';
import '../prelude.dart';

class FramelessWindow extends StatelessWidget {
  final Widget child;

  const FramelessWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (theme) => Scaffold(
        body: Column(
          children: [
            _TitleBar(theme: theme),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  final AppTheme theme;

  const _TitleBar({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(),
          ),
          MinimizeWindowButton(
            colors: WindowButtonColors(
              iconNormal: theme.text1,
              iconMouseOver: theme.text1,
              iconMouseDown: theme.text1,
              normal: theme.bg1,
              mouseOver: theme.bg2,
              mouseDown: theme.bg2,
            ),
          ),
          MaximizeWindowButton(
            colors: WindowButtonColors(
              iconNormal: theme.text1,
              iconMouseOver: theme.text1,
              iconMouseDown: theme.text1,
              normal: theme.bg1,
              mouseOver: theme.bg2,
              mouseDown: theme.bg2,
            ),
          ),
          CloseWindowButton(
            colors: WindowButtonColors(
              iconNormal: theme.text1,
              iconMouseOver: theme.text1,
              iconMouseDown: theme.text1,
              normal: theme.bg1,
              mouseOver: theme.error,
              mouseDown: theme.error,
            ),
          ),
        ],
      ),
    );
  }
}
