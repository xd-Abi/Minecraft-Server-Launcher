import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:msl/startup/launcher.dart';
import 'package:msl/startup/tasks/init_app.dart';

/// GetIt instance
final GetIt getIt = GetIt.instance;

abstract class EntryPoint {
  Widget create();
}

class AppRunner {
  AppRunner._();

  static Future<void> run(EntryPoint entryPoint) async {
    getIt.registerFactory<EntryPoint>(() => entryPoint);
    getIt.registerLazySingleton<AppLauncher>(() => AppLauncher(getIt));

    getIt<AppLauncher>().addTask(InitAppWidgetTask());

    getIt<AppLauncher>().launch();
  }
}
