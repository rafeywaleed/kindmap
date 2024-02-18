import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dark_theme_menu_screen/models/dark_theme_menu_model.dart';
part 'dark_theme_menu_state.dart';

final darkThemeMenuNotifier =
    StateNotifierProvider<DarkThemeMenuNotifier, DarkThemeMenuState>((ref) =>
        DarkThemeMenuNotifier(
            DarkThemeMenuState(darkThemeMenuModelObj: DarkThemeMenuModel())));

/// A notifier that manages the state of a DarkThemeMenu according to the event that is dispatched to it.
class DarkThemeMenuNotifier extends StateNotifier<DarkThemeMenuState> {
  DarkThemeMenuNotifier(DarkThemeMenuState state) : super(state);
}
