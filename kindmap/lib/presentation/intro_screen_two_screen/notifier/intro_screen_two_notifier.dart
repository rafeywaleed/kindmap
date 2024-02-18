import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/intro_screen_two_screen/models/intro_screen_two_model.dart';
part 'intro_screen_two_state.dart';

final introScreenTwoNotifier = StateNotifierProvider<IntroScreenTwoNotifier,
        IntroScreenTwoState>(
    (ref) => IntroScreenTwoNotifier(
        IntroScreenTwoState(introScreenTwoModelObj: IntroScreenTwoModel())));

/// A notifier that manages the state of a IntroScreenTwo according to the event that is dispatched to it.
class IntroScreenTwoNotifier extends StateNotifier<IntroScreenTwoState> {
  IntroScreenTwoNotifier(IntroScreenTwoState state) : super(state);
}
