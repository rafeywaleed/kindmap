import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_change_name_one_screen/models/lt_change_name_one_model.dart';
part 'lt_change_name_one_state.dart';

final ltChangeNameOneNotifier =
    StateNotifierProvider<LtChangeNameOneNotifier, LtChangeNameOneState>(
        (ref) => LtChangeNameOneNotifier(LtChangeNameOneState(
            oldPasswordEditTextController: TextEditingController(),
            newPasswordEditTextController: TextEditingController(),
            confirmPasswordEditTextController: TextEditingController(),
            ltChangeNameOneModelObj: LtChangeNameOneModel())));

/// A notifier that manages the state of a LtChangeNameOne according to the event that is dispatched to it.
class LtChangeNameOneNotifier extends StateNotifier<LtChangeNameOneState> {
  LtChangeNameOneNotifier(LtChangeNameOneState state) : super(state);
}
