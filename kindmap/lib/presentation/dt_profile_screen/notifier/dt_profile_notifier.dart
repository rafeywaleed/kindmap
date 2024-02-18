import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_profile_screen/models/dt_profile_model.dart';
part 'dt_profile_state.dart';

final dtProfileNotifier =
    StateNotifierProvider<DtProfileNotifier, DtProfileState>((ref) =>
        DtProfileNotifier(DtProfileState(dtProfileModelObj: DtProfileModel())));

/// A notifier that manages the state of a DtProfile according to the event that is dispatched to it.
class DtProfileNotifier extends StateNotifier<DtProfileState> {
  DtProfileNotifier(DtProfileState state) : super(state);
}
