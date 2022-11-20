import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

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
            const VSpace(50),
            const _NameField(),
            const VSpace(30),
            const _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkspaceBloc, CreateWorkspaceState>(
      builder: (context, state) => AppTextField(
        hint: 'Name',
        icon: LineIcons.tag,
        onChanged: (value) => context
            .read<CreateWorkspaceBloc>()
            .add(CreateWorkspaceEvent.nameChange(value)),
        errorText: context
            .read<CreateWorkspaceBloc>()
            .state
            .nameError
            .fold(() => '', (error) => error),
      ),
      buildWhen: (previous, current) => previous.nameError != current.nameError,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkspaceBloc, CreateWorkspaceState>(
      builder: (context, state) => AppButton(
        onPressed: () => context
            .read<CreateWorkspaceBloc>()
            .add(const CreateWorkspaceEvent.submit()),
        child: AppText.h2('Create'),
      ),
    );
  }
}
