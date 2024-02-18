import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_permissions_screen/models/dt_permissions_model.dart';
part 'dt_permissions_state.dart';

final dtPermissionsNotifier =
    StateNotifierProvider<DtPermissionsNotifier, DtPermissionsState>((ref) =>
        DtPermissionsNotifier(DtPermissionsState(
            isSelectedSwitch: false,
            isSelectedSwitch1: false,
            dtPermissionsModelObj: DtPermissionsModel())));

/// A notifier that manages the state of a DtPermissions according to the event that is dispatched to it.
class DtPermissionsNotifier extends StateNotifier<DtPermissionsState> {
  DtPermissionsNotifier(DtPermissionsState state) : super(state);

  void changeSwitchBox1(bool value) {
    state = state.copyWith(isSelectedSwitch: value);
  }

  void changeSwitchBox2(bool value) {
    state = state.copyWith(isSelectedSwitch1: value);
  }
}
