// ignore_for_file: must_be_immutable

part of 'lt_permissions_notifier.dart';

/// Represents the state of LtPermissions in the application.
class LtPermissionsState extends Equatable {
  LtPermissionsState({
    this.isSelectedSwitch = false,
    this.isSelectedSwitch1 = false,
    this.ltPermissionsModelObj,
  });

  LtPermissionsModel? ltPermissionsModelObj;

  bool isSelectedSwitch;

  bool isSelectedSwitch1;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        isSelectedSwitch1,
        ltPermissionsModelObj,
      ];

  LtPermissionsState copyWith({
    bool? isSelectedSwitch,
    bool? isSelectedSwitch1,
    LtPermissionsModel? ltPermissionsModelObj,
  }) {
    return LtPermissionsState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      isSelectedSwitch1: isSelectedSwitch1 ?? this.isSelectedSwitch1,
      ltPermissionsModelObj:
          ltPermissionsModelObj ?? this.ltPermissionsModelObj,
    );
  }
}
