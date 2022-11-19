import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'launcher.dart';
import 'tasks/init_app.dart';
import 'tasks/init_services.dart';
import 'tasks/resolve_dependencies.dart';

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

    getIt<AppLauncher>().addTask(InitServices());
    getIt<AppLauncher>().addTask(ResolveDependencies());
    getIt<AppLauncher>().addTask(InitAppWidgetTask());

    getIt<AppLauncher>().launch();
  }
}
