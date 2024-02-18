import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_camera_screen/models/dt_camera_model.dart';
part 'dt_camera_state.dart';

final dtCameraNotifier = StateNotifierProvider<DtCameraNotifier, DtCameraState>(
    (ref) =>
        DtCameraNotifier(DtCameraState(dtCameraModelObj: DtCameraModel())));

/// A notifier that manages the state of a DtCamera according to the event that is dispatched to it.
class DtCameraNotifier extends StateNotifier<DtCameraState> {
  DtCameraNotifier(DtCameraState state) : super(state);
}
