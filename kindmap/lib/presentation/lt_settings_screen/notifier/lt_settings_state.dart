// ignore_for_file: must_be_immutable

part of 'lt_settings_notifier.dart';

/// Represents the state of LtSettings in the application.
class LtSettingsState extends Equatable {
  LtSettingsState({
    this.isSelectedSwitch = false,
    this.ltSettingsModelObj,
  });

  LtSettingsModel? ltSettingsModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        ltSettingsModelObj,
      ];

  LtSettingsState copyWith({
    bool? isSelectedSwitch,
    LtSettingsModel? ltSettingsModelObj,
  }) {
    return LtSettingsState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      ltSettingsModelObj: ltSettingsModelObj ?? this.ltSettingsModelObj,
    );
  }
}
