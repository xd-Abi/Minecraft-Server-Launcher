import 'package:get_it/get_it.dart';

class LauncherContext {
  final GetIt getIt;

  LauncherContext(this.getIt);
}

abstract class LauncherTask {
  Future<void> init(LauncherContext context);
}

class AppLauncher {
  final List<LauncherTask> tasks;
  final GetIt getIt;

  AppLauncher(this.getIt) : tasks = List.from([]);

  void addTask(LauncherTask task) {
    tasks.add(task);
  }

  Future<void> launch() async {
    final context = LauncherContext(getIt);

    for (var task in tasks) {
      await task.init(context);
    }
  }
}
