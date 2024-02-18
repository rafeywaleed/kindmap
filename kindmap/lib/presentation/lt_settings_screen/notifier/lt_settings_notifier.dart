import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_settings_screen/models/lt_settings_model.dart';
part 'lt_settings_state.dart';

final ltSettingsNotifier =
    StateNotifierProvider<LtSettingsNotifier, LtSettingsState>((ref) =>
        LtSettingsNotifier(LtSettingsState(
            isSelectedSwitch: false, ltSettingsModelObj: LtSettingsModel())));

/// A notifier that manages the state of a LtSettings according to the event that is dispatched to it.
class LtSettingsNotifier extends StateNotifier<LtSettingsState> {
  LtSettingsNotifier(LtSettingsState state) : super(state);

  void changeSwitchBox1(bool value) {
    state = state.copyWith(isSelectedSwitch: value);
  }
}
