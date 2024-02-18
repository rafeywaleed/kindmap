// ignore_for_file: must_be_immutable

part of 'sign_up_page_notifier.dart';

/// Represents the state of SignUpPage in the application.
class SignUpPageState extends Equatable {
  SignUpPageState({
    this.fullNameController,
    this.passwordController,
    this.signUpPageModelObj,
  });

  TextEditingController? fullNameController;

  TextEditingController? passwordController;

  SignUpPageModel? signUpPageModelObj;

  @override
  List<Object?> get props => [
        fullNameController,
        passwordController,
        signUpPageModelObj,
      ];

  SignUpPageState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? passwordController,
    SignUpPageModel? signUpPageModelObj,
  }) {
    return SignUpPageState(
      fullNameController: fullNameController ?? this.fullNameController,
      passwordController: passwordController ?? this.passwordController,
      signUpPageModelObj: signUpPageModelObj ?? this.signUpPageModelObj,
    );
  }
}
