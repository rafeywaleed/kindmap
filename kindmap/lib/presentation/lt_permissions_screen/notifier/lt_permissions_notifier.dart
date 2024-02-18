import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_permissions_screen/models/lt_permissions_model.dart';
part 'lt_permissions_state.dart';

final ltPermissionsNotifier =
    StateNotifierProvider<LtPermissionsNotifier, LtPermissionsState>((ref) =>
        LtPermissionsNotifier(LtPermissionsState(
            isSelectedSwitch: false,
            isSelectedSwitch1: false,
            ltPermissionsModelObj: LtPermissionsModel())));

/// A notifier that manages the state of a LtPermissions according to the event that is dispatched to it.
class LtPermissionsNotifier extends StateNotifier<LtPermissionsState> {
  LtPermissionsNotifier(LtPermissionsState state) : super(state);

  void changeSwitchBox1(bool value) {
    state = state.copyWith(isSelectedSwitch: value);
  }

  void changeSwitchBox2(bool value) {
    state = state.copyWith(isSelectedSwitch1: value);
  }
}
