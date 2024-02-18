import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_change_password_screen/models/dt_change_password_model.dart';
part 'dt_change_password_state.dart';

final dtChangePasswordNotifier =
    StateNotifierProvider<DtChangePasswordNotifier, DtChangePasswordState>(
        (ref) => DtChangePasswordNotifier(DtChangePasswordState(
            oldPasswordEditTextController: TextEditingController(),
            newPasswordEditTextController: TextEditingController(),
            confirmPasswordEditTextController: TextEditingController(),
            dtChangePasswordModelObj: DtChangePasswordModel())));

/// A notifier that manages the state of a DtChangePassword according to the event that is dispatched to it.
class DtChangePasswordNotifier extends StateNotifier<DtChangePasswordState> {
  DtChangePasswordNotifier(DtChangePasswordState state) : super(state);
}
