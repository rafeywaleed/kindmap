// ignore_for_file: must_be_immutable

part of 'sign_up_page_notifier.dart';

/// Represents the state of SignUpPage in the application.
class SignUpPageState extends Equatable {
  SignUpPageState({
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.signUpPageModelObj,
  });

  TextEditingController? fullNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  SignUpPageModel? signUpPageModelObj;

  @override
  List<Object?> get props => [
        fullNameController,
        emailController,
        passwordController,
        signUpPageModelObj,
      ];

  SignUpPageState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    SignUpPageModel? signUpPageModelObj,
  }) {
    return SignUpPageState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      signUpPageModelObj: signUpPageModelObj ?? this.signUpPageModelObj,
    );
  }
}
