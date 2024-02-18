import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/light_theme_screen/models/light_theme_model.dart';
part 'light_theme_state.dart';

final lightThemeNotifier =
    StateNotifierProvider<LightThemeNotifier, LightThemeState>((ref) =>
        LightThemeNotifier(
            LightThemeState(lightThemeModelObj: LightThemeModel())));

/// A notifier that manages the state of a LightTheme according to the event that is dispatched to it.
class LightThemeNotifier extends StateNotifier<LightThemeState> {
  LightThemeNotifier(LightThemeState state) : super(state);
}
