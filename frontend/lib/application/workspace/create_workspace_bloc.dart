import 'dart:io';

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
            Option<String> error = none();

            if (name.trim().isEmpty) {
              error = some("Name can't be empty");
            }

            emit(state.copyWith(name: name, nameError: error));
          },
          pathChange: (path) async {
            Option<String> error = none();

            if (!await Directory(path).exists()) {
              error = some('Directory does not exist');
            }

            state.copyWith(path: path, pathError: error);
          },
          serverVersionChange: (version) {
            state.copyWith(version: version);
          },
          submit: () async {
            if (state.name.trim().isEmpty) {
              emit(state.copyWith(nameError: some("Name can't be empty")));
            }
            if (!await Directory(state.path).exists()) {
              emit(state.copyWith(pathError: some("Name can't be empty")));
            }

            if (state.nameError.isSome() ||
                state.pathError.isSome() ||
                state.versionError.isSome()) {
              return;
            }

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
  const factory CreateWorkspaceState({
    required String name,
    required String path,
    required String version,
    required Option<String> nameError,
    required Option<String> pathError,
    required Option<String> versionError,
    required Option<Either<Workspace, AppError>> successOrFail,
  }) = _CreateWorkspaceState;

  factory CreateWorkspaceState.initial() => CreateWorkspaceState(
        name: '',
        path: '',
        version: '',
        nameError: none(),
        pathError: none(),
        versionError: none(),
        successOrFail: none(),
      );
}
