import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msl/core/error.dart';
import 'package:msl/startup/startup.dart';
import 'package:msl/workspace/application/core/create_workspace_bloc.dart';
import 'package:msl/workspace/application/core/workspace.dart';

class CreateWorkspaceScreen extends StatelessWidget {
  const CreateWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateWorkspaceBloc>(),
      child: BlocListener<CreateWorkspaceBloc, CreateWorkspaceState>(
        listener: (context, state) {
          state.successOrFail.fold(
            () => {},
            (result) => _handleSuccessOrFail(context, result),
          );
        },
        child: const Scaffold(body: _CreateWorkspaceForm()),
      ),
    );
  }

  void _handleSuccessOrFail(
      BuildContext context, Either<Workspace, AppError> result) {
    result.fold(
      (workspace) => {},
      (error) => {},
    );
  }
}

class _CreateWorkspaceForm extends StatelessWidget {
  const _CreateWorkspaceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 300,
        height: 400,
        decoration: const BoxDecoration(color: Colors.grey),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
