import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/prelude.dart';

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
