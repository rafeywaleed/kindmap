import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_submission_page_screen/models/lt_submission_page_model.dart';
part 'lt_submission_page_state.dart';

final ltSubmissionPageNotifier =
    StateNotifierProvider<LtSubmissionPageNotifier, LtSubmissionPageState>(
        (ref) => LtSubmissionPageNotifier(LtSubmissionPageState(
            addANoteController: TextEditingController(),
            locationController: TextEditingController(),
            ltSubmissionPageModelObj: LtSubmissionPageModel())));

/// A notifier that manages the state of a LtSubmissionPage according to the event that is dispatched to it.
class LtSubmissionPageNotifier extends StateNotifier<LtSubmissionPageState> {
  LtSubmissionPageNotifier(LtSubmissionPageState state) : super(state);
}
