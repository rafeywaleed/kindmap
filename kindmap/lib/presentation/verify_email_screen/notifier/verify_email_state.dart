// ignore_for_file: must_be_immutable

part of 'verify_email_notifier.dart';

/// Represents the state of VerifyEmail in the application.
class VerifyEmailState extends Equatable {
  VerifyEmailState({
    this.emailController,
    this.verifyEmailModelObj,
  });

  TextEditingController? emailController;

  VerifyEmailModel? verifyEmailModelObj;

  @override
  List<Object?> get props => [
        emailController,
        verifyEmailModelObj,
      ];

  VerifyEmailState copyWith({
    TextEditingController? emailController,
    VerifyEmailModel? verifyEmailModelObj,
  }) {
    return VerifyEmailState(
      emailController: emailController ?? this.emailController,
      verifyEmailModelObj: verifyEmailModelObj ?? this.verifyEmailModelObj,
    );
  }
}
