import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_about_screen/models/lt_about_model.dart';
part 'lt_about_state.dart';

final ltAboutNotifier = StateNotifierProvider<LtAboutNotifier, LtAboutState>(
    (ref) => LtAboutNotifier(LtAboutState(ltAboutModelObj: LtAboutModel())));

/// A notifier that manages the state of a LtAbout according to the event that is dispatched to it.
class LtAboutNotifier extends StateNotifier<LtAboutState> {
  LtAboutNotifier(LtAboutState state) : super(state);
}
