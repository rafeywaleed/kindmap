import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_profile_screen/models/lt_profile_model.dart';
part 'lt_profile_state.dart';

final ltProfileNotifier =
    StateNotifierProvider<LtProfileNotifier, LtProfileState>((ref) =>
        LtProfileNotifier(LtProfileState(ltProfileModelObj: LtProfileModel())));

/// A notifier that manages the state of a LtProfile according to the event that is dispatched to it.
class LtProfileNotifier extends StateNotifier<LtProfileState> {
  LtProfileNotifier(LtProfileState state) : super(state);
}
