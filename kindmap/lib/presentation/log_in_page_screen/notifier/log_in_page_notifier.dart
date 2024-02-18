import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/log_in_page_screen/models/log_in_page_model.dart';
part 'log_in_page_state.dart';

final logInPageNotifier =
    StateNotifierProvider<LogInPageNotifier, LogInPageState>((ref) =>
        LogInPageNotifier(LogInPageState(
            emailFieldController: TextEditingController(),
            passwordFieldController: TextEditingController(),
            logInPageModelObj: LogInPageModel())));

/// A notifier that manages the state of a LogInPage according to the event that is dispatched to it.
class LogInPageNotifier extends StateNotifier<LogInPageState> {
  LogInPageNotifier(LogInPageState state) : super(state);
}
