import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_about_screen/models/dt_about_model.dart';
part 'dt_about_state.dart';

final dtAboutNotifier = StateNotifierProvider<DtAboutNotifier, DtAboutState>(
    (ref) => DtAboutNotifier(DtAboutState(dtAboutModelObj: DtAboutModel())));

/// A notifier that manages the state of a DtAbout according to the event that is dispatched to it.
class DtAboutNotifier extends StateNotifier<DtAboutState> {
  DtAboutNotifier(DtAboutState state) : super(state);
}
