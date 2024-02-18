// ignore_for_file: must_be_immutable

part of 'log_in_page_notifier.dart';

/// Represents the state of LogInPage in the application.
class LogInPageState extends Equatable {
  LogInPageState({
    this.emailFieldController,
    this.passwordFieldController,
    this.logInPageModelObj,
  });

  TextEditingController? emailFieldController;

  TextEditingController? passwordFieldController;

  LogInPageModel? logInPageModelObj;

  @override
  List<Object?> get props => [
        emailFieldController,
        passwordFieldController,
        logInPageModelObj,
      ];

  LogInPageState copyWith({
    TextEditingController? emailFieldController,
    TextEditingController? passwordFieldController,
    LogInPageModel? logInPageModelObj,
  }) {
    return LogInPageState(
      emailFieldController: emailFieldController ?? this.emailFieldController,
      passwordFieldController:
          passwordFieldController ?? this.passwordFieldController,
      logInPageModelObj: logInPageModelObj ?? this.logInPageModelObj,
    );
  }
}
