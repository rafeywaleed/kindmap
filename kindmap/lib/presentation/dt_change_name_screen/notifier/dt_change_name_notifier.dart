import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_change_name_screen/models/dt_change_name_model.dart';
part 'dt_change_name_state.dart';

final dtChangeNameNotifier =
    StateNotifierProvider<DtChangeNameNotifier, DtChangeNameState>((ref) =>
        DtChangeNameNotifier(DtChangeNameState(
            newNamePlaceholderController: TextEditingController(),
            dtChangeNameModelObj: DtChangeNameModel())));

/// A notifier that manages the state of a DtChangeName according to the event that is dispatched to it.
class DtChangeNameNotifier extends StateNotifier<DtChangeNameState> {
  DtChangeNameNotifier(DtChangeNameState state) : super(state);
}
