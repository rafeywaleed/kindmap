import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_settings_screen/models/dt_settings_model.dart';
part 'dt_settings_state.dart';

final dtSettingsNotifier =
    StateNotifierProvider<DtSettingsNotifier, DtSettingsState>((ref) =>
        DtSettingsNotifier(DtSettingsState(
            isSelectedSwitch: false, dtSettingsModelObj: DtSettingsModel())));

/// A notifier that manages the state of a DtSettings according to the event that is dispatched to it.
class DtSettingsNotifier extends StateNotifier<DtSettingsState> {
  DtSettingsNotifier(DtSettingsState state) : super(state);

  void changeSwitchBox1(bool value) {
    state = state.copyWith(isSelectedSwitch: value);
  }
}
