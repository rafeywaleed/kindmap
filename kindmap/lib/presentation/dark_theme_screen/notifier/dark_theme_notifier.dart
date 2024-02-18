import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dark_theme_screen/models/dark_theme_model.dart';
part 'dark_theme_state.dart';

final darkThemeNotifier =
    StateNotifierProvider<DarkThemeNotifier, DarkThemeState>((ref) =>
        DarkThemeNotifier(DarkThemeState(darkThemeModelObj: DarkThemeModel())));

/// A notifier that manages the state of a DarkTheme according to the event that is dispatched to it.
class DarkThemeNotifier extends StateNotifier<DarkThemeState> {
  DarkThemeNotifier(DarkThemeState state) : super(state);
}
