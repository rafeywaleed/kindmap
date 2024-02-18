// ignore_for_file: must_be_immutable

part of 'dt_camera_notifier.dart';

/// Represents the state of DtCamera in the application.
class DtCameraState extends Equatable {
  DtCameraState({this.dtCameraModelObj});

  DtCameraModel? dtCameraModelObj;

  @override
  List<Object?> get props => [
        dtCameraModelObj,
      ];

  DtCameraState copyWith({DtCameraModel? dtCameraModelObj}) {
    return DtCameraState(
      dtCameraModelObj: dtCameraModelObj ?? this.dtCameraModelObj,
    );
  }
}
