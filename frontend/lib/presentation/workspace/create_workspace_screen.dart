import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/prelude.dart';
import '../../launch/startup.dart';
import '../widgets/prelude.dart';

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
        child: const _CreateWorkspaceForm(),
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
      child: AppCard(
        width: 400,
        height: 500,
        child: Column(
          children: [
            AppText.h1('Create Server'),
          ],
        ),
      ),
    );
  }
}
