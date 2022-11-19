import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'workspace.dart';
import 'workspace_service.dart';
import '../core/prelude.dart';

part 'create_workspace_bloc.freezed.dart';

class CreateWorkspaceBloc
    extends Bloc<CreateWorkspaceEvent, CreateWorkspaceState> {
  final WorkspaceService workspaceService;

  CreateWorkspaceBloc(this.workspaceService)
      : super(CreateWorkspaceState.initial()) {
    on<CreateWorkspaceEvent>(
      (event, emit) async => {
        await event.when(
          nameChange: (name) {
            state.copyWith(name: name);
          },
          pathChange: (path) {
            state.copyWith(path: path);
          },
          serverVersionChange: (version) {
            state.copyWith(version: version);
          },
          submit: () async {
            Either<Workspace, AppError> succesOrFail =
                await workspaceService.create(
              name: state.name,
              path: state.path,
              version: state.version,
            );

            emit(state.copyWith(successOrFail: some(succesOrFail)));
          },
        )
      },
    );
  }
}

@freezed
class CreateWorkspaceEvent with _$CreateWorkspaceEvent {
  const factory CreateWorkspaceEvent.nameChange(String name) = _NameChangeEvent;
  const factory CreateWorkspaceEvent.pathChange(String path) = _PathChangeEvent;
  const factory CreateWorkspaceEvent.serverVersionChange(String version) =
      _ServerVersionChangeEvent;

  const factory CreateWorkspaceEvent.submit() = _SubmitEvent;
}

@freezed
class CreateWorkspaceState with _$CreateWorkspaceState {
  factory CreateWorkspaceState({
    required String name,
    required String path,
    required String version,
    required Option<Either<Workspace, AppError>> successOrFail,
  }) = _CreateWorkspaceState;

  factory CreateWorkspaceState.initial() => CreateWorkspaceState(
        name: '',
        path: '',
        version: '',
        successOrFail: none(),
      );
}
