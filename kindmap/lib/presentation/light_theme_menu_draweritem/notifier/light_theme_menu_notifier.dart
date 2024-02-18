import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/light_theme_menu_draweritem/models/light_theme_menu_model.dart';
part 'light_theme_menu_state.dart';

final lightThemeMenuNotifier =
    StateNotifierProvider<LightThemeMenuNotifier, LightThemeMenuState>((ref) =>
        LightThemeMenuNotifier(LightThemeMenuState(
            isSelectedSwitch: false,
            lightThemeMenuModelObj: LightThemeMenuModel())));

/// A notifier that manages the state of a LightThemeMenu according to the event that is dispatched to it.
class LightThemeMenuNotifier extends StateNotifier<LightThemeMenuState> {
  LightThemeMenuNotifier(LightThemeMenuState state) : super(state);

  void changeSwitchBox1(bool value) {
    state = state.copyWith(isSelectedSwitch: value);
  }
}
