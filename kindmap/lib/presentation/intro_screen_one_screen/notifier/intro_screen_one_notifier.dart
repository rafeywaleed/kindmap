import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/intro_screen_one_screen/models/intro_screen_one_model.dart';
part 'intro_screen_one_state.dart';

final introScreenOneNotifier = StateNotifierProvider<IntroScreenOneNotifier,
        IntroScreenOneState>(
    (ref) => IntroScreenOneNotifier(
        IntroScreenOneState(introScreenOneModelObj: IntroScreenOneModel())));

/// A notifier that manages the state of a IntroScreenOne according to the event that is dispatched to it.
class IntroScreenOneNotifier extends StateNotifier<IntroScreenOneState> {
  IntroScreenOneNotifier(IntroScreenOneState state) : super(state);
}
