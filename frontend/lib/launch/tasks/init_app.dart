import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../launcher.dart';
import '../startup.dart';
import '../../application/prelude.dart';

class InitAppWidgetTask extends LauncherTask {
  @override
  Future<void> init(LauncherContext context) async {
    final widget = context.getIt<EntryPoint>().create();

    runApp(_AppWidget(child: widget));

    doWhenWindowReady(() {
      const initialSize = Size(1280, 720);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class _AppWidget extends StatelessWidget {
  final Widget child;

  const _AppWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppearanceSettingsBloc(),
      child: BlocBuilder<AppearanceSettingsBloc, AppearanceSettingsState>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.appearance.theme.toThemeData(),
          home: child,
        ),
      ),
    );
  }
}
