import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/intro_screen_four_screen/models/intro_screen_four_model.dart';
part 'intro_screen_four_state.dart';

final introScreenFourNotifier = StateNotifierProvider<IntroScreenFourNotifier,
        IntroScreenFourState>(
    (ref) => IntroScreenFourNotifier(
        IntroScreenFourState(introScreenFourModelObj: IntroScreenFourModel())));

/// A notifier that manages the state of a IntroScreenFour according to the event that is dispatched to it.
class IntroScreenFourNotifier extends StateNotifier<IntroScreenFourState> {
  IntroScreenFourNotifier(IntroScreenFourState state) : super(state);
}
