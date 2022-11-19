import '../launcher.dart';
import '../startup.dart';
import '../../application/prelude.dart';

class ResolveDependencies extends LauncherTask {
  @override
  Future<void> init(LauncherContext context) async {
    WorkspaceService workspaceService = getIt<WorkspaceService>();
    getIt.registerFactory<CreateWorkspaceBloc>(
        () => CreateWorkspaceBloc(workspaceService));
  }
}
