import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_change_name_screen/models/lt_change_name_model.dart';
part 'lt_change_name_state.dart';

final ltChangeNameNotifier =
    StateNotifierProvider<LtChangeNameNotifier, LtChangeNameState>((ref) =>
        LtChangeNameNotifier(LtChangeNameState(
            newNamePlaceholderController: TextEditingController(),
            ltChangeNameModelObj: LtChangeNameModel())));

/// A notifier that manages the state of a LtChangeName according to the event that is dispatched to it.
class LtChangeNameNotifier extends StateNotifier<LtChangeNameState> {
  LtChangeNameNotifier(LtChangeNameState state) : super(state);
}
