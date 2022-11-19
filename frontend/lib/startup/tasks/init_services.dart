import 'package:msl/startup/launcher.dart';
import 'package:msl/startup/startup.dart';
import 'package:msl/workspace/application/core/workspace_service.dart';

class InitServices extends LauncherTask {
  @override
  Future<void> init(LauncherContext context) async {
    getIt.registerLazySingleton<WorkspaceService>(() => WorkspaceService());
  }
}
