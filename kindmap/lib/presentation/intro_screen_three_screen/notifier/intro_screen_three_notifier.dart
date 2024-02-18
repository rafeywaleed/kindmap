import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/intro_screen_three_screen/models/intro_screen_three_model.dart';
part 'intro_screen_three_state.dart';

final introScreenThreeNotifier =
    StateNotifierProvider<IntroScreenThreeNotifier, IntroScreenThreeState>(
        (ref) => IntroScreenThreeNotifier(IntroScreenThreeState(
            introScreenThreeModelObj: IntroScreenThreeModel())));

/// A notifier that manages the state of a IntroScreenThree according to the event that is dispatched to it.
class IntroScreenThreeNotifier extends StateNotifier<IntroScreenThreeState> {
  IntroScreenThreeNotifier(IntroScreenThreeState state) : super(state);
}
