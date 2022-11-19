import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msl/workspace/application/settings/appearance.dart';
import 'package:msl/workspace/application/settings/appearance_settings_bloc.dart';

class ThemeBuilder extends StatelessWidget {
  final Widget Function(AppTheme theme) builder;

  const ThemeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppearanceSettingsBloc, AppearanceSettingsState>(
      builder: (context, state) => builder(state.appearance.theme),
    );
  }
}
