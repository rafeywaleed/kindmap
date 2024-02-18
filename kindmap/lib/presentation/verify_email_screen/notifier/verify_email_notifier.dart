import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/verify_email_screen/models/verify_email_model.dart';
part 'verify_email_state.dart';

final verifyEmailNotifier =
    StateNotifierProvider<VerifyEmailNotifier, VerifyEmailState>((ref) =>
        VerifyEmailNotifier(VerifyEmailState(
            emailController: TextEditingController(),
            verifyEmailModelObj: VerifyEmailModel())));

/// A notifier that manages the state of a VerifyEmail according to the event that is dispatched to it.
class VerifyEmailNotifier extends StateNotifier<VerifyEmailState> {
  VerifyEmailNotifier(VerifyEmailState state) : super(state);
}
