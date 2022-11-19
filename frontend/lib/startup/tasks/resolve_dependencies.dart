import 'package:msl/startup/launcher.dart';
import 'package:msl/startup/startup.dart';
import 'package:msl/workspace/application/core/create_workspace_bloc.dart';
import 'package:msl/workspace/application/core/workspace_service.dart';

class ResolveDependencies extends LauncherTask {
  @override
  Future<void> init(LauncherContext context) async {
    WorkspaceService workspaceService = getIt<WorkspaceService>();
    getIt.registerFactory<CreateWorkspaceBloc>(
        () => CreateWorkspaceBloc(workspaceService));
  }
}
