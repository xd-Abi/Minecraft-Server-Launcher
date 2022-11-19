import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'appearance.dart';

part 'appearance_settings_bloc.freezed.dart';

class AppearanceSettingsBloc
    extends Bloc<AppearanceSettingsEvent, AppearanceSettingsState> {
  AppearanceSettingsBloc() : super(AppearanceSettingsState.initial()) {
    on<AppearanceSettingsEvent>(
      (event, emit) async => {
        event.when(
          themeChange: (brightness) {
            Appearance appearance = state.appearance
                .copyWith(theme: AppTheme.fromBrightness(brightness));
            emit(state.copyWith(appearance: appearance));
          },
        )
      },
    );
  }
}

@freezed
class AppearanceSettingsEvent with _$AppearanceSettingsEvent {
  const factory AppearanceSettingsEvent.themeChange(Brightness brightness) =
      _ThemeChangeEvent;
}

@freezed
class AppearanceSettingsState with _$AppearanceSettingsState {
  const factory AppearanceSettingsState({
    required Appearance appearance,
  }) = _AppearanceSettingsState;

  factory AppearanceSettingsState.initial() =>
      AppearanceSettingsState(appearance: Appearance(theme: AppTheme.dark()));
}
