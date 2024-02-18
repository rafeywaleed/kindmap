import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_submission_page_screen/models/dt_submission_page_model.dart';
part 'dt_submission_page_state.dart';

final dtSubmissionPageNotifier =
    StateNotifierProvider<DtSubmissionPageNotifier, DtSubmissionPageState>(
        (ref) => DtSubmissionPageNotifier(DtSubmissionPageState(
            locationController: TextEditingController(),
            dtSubmissionPageModelObj: DtSubmissionPageModel())));

/// A notifier that manages the state of a DtSubmissionPage according to the event that is dispatched to it.
class DtSubmissionPageNotifier extends StateNotifier<DtSubmissionPageState> {
  DtSubmissionPageNotifier(DtSubmissionPageState state) : super(state);
}
