import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msl/startup/launcher.dart';
import 'package:msl/startup/startup.dart';
import 'package:msl/workspace/application/settings/appearance_settings_bloc.dart';

class InitAppWidgetTask extends LauncherTask {
  @override
  Future<void> init(LauncherContext context) async {
    final widget = context.getIt<EntryPoint>().create();

    runApp(_AppWidget(child: widget));
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
