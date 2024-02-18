import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/app_navigation_screen/models/app_navigation_model.dart';
part 'app_navigation_state.dart';

final appNavigationNotifier =
    StateNotifierProvider<AppNavigationNotifier, AppNavigationState>(
  (ref) => AppNavigationNotifier(AppNavigationState(
    appNavigationModelObj: AppNavigationModel(),
  )),
);

/// A notifier that manages the state of a AppNavigation according to the event that is dispatched to it.
class AppNavigationNotifier extends StateNotifier<AppNavigationState> {
  AppNavigationNotifier(AppNavigationState state) : super(state) {}
}
