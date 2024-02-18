import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/sign_up_page_screen/models/sign_up_page_model.dart';
part 'sign_up_page_state.dart';

final signUpPageNotifier =
    StateNotifierProvider<SignUpPageNotifier, SignUpPageState>((ref) =>
        SignUpPageNotifier(SignUpPageState(
            fullNameController: TextEditingController(),
            passwordController: TextEditingController(),
            signUpPageModelObj: SignUpPageModel())));

/// A notifier that manages the state of a SignUpPage according to the event that is dispatched to it.
class SignUpPageNotifier extends StateNotifier<SignUpPageState> {
  SignUpPageNotifier(SignUpPageState state) : super(state);
}
