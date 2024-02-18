// ignore_for_file: must_be_immutable

part of 'lt_camera_notifier.dart';

/// Represents the state of LtCamera in the application.
class LtCameraState extends Equatable {
  LtCameraState({this.ltCameraModelObj});

  LtCameraModel? ltCameraModelObj;

  @override
  List<Object?> get props => [
        ltCameraModelObj,
      ];

  LtCameraState copyWith({LtCameraModel? ltCameraModelObj}) {
    return LtCameraState(
      ltCameraModelObj: ltCameraModelObj ?? this.ltCameraModelObj,
    );
  }
}
