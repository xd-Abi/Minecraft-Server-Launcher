import 'package:flutter/material.dart';
import 'package:msl/startup/launcher.dart';
import 'package:msl/startup/startup.dart';

class InitAppWidgetTask extends LauncherTask {
  @override
  Future<void> init(LauncherContext context) async {
    final widget = context.getIt<EntryPoint>().create();

    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: widget,
      ),
    );
  }
}
