import '../launcher.dart';
import '../startup.dart';
import '../../application/prelude.dart';

class InitServices extends LauncherTask {
  @override
  Future<void> init(LauncherContext context) async {
    getIt.registerLazySingleton<WorkspaceService>(() => WorkspaceService());
  }
}
