// ignore_for_file: must_be_immutable

part of 'dt_settings_notifier.dart';

/// Represents the state of DtSettings in the application.
class DtSettingsState extends Equatable {
  DtSettingsState({
    this.isSelectedSwitch = false,
    this.dtSettingsModelObj,
  });

  DtSettingsModel? dtSettingsModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        dtSettingsModelObj,
      ];

  DtSettingsState copyWith({
    bool? isSelectedSwitch,
    DtSettingsModel? dtSettingsModelObj,
  }) {
    return DtSettingsState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      dtSettingsModelObj: dtSettingsModelObj ?? this.dtSettingsModelObj,
    );
  }
}
