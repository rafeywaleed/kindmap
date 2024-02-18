import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_camera_screen/models/lt_camera_model.dart';
part 'lt_camera_state.dart';

final ltCameraNotifier = StateNotifierProvider<LtCameraNotifier, LtCameraState>(
    (ref) =>
        LtCameraNotifier(LtCameraState(ltCameraModelObj: LtCameraModel())));

/// A notifier that manages the state of a LtCamera according to the event that is dispatched to it.
class LtCameraNotifier extends StateNotifier<LtCameraState> {
  LtCameraNotifier(LtCameraState state) : super(state);
}
