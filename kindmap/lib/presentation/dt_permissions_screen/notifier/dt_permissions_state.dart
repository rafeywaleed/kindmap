// ignore_for_file: must_be_immutable

part of 'dt_permissions_notifier.dart';

/// Represents the state of DtPermissions in the application.
class DtPermissionsState extends Equatable {
  DtPermissionsState({
    this.isSelectedSwitch = false,
    this.isSelectedSwitch1 = false,
    this.dtPermissionsModelObj,
  });

  DtPermissionsModel? dtPermissionsModelObj;

  bool isSelectedSwitch;

  bool isSelectedSwitch1;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        isSelectedSwitch1,
        dtPermissionsModelObj,
      ];

  DtPermissionsState copyWith({
    bool? isSelectedSwitch,
    bool? isSelectedSwitch1,
    DtPermissionsModel? dtPermissionsModelObj,
  }) {
    return DtPermissionsState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      isSelectedSwitch1: isSelectedSwitch1 ?? this.isSelectedSwitch1,
      dtPermissionsModelObj:
          dtPermissionsModelObj ?? this.dtPermissionsModelObj,
    );
  }
}
