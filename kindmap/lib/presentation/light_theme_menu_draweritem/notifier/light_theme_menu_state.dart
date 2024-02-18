// ignore_for_file: must_be_immutable

part of 'light_theme_menu_notifier.dart';

/// Represents the state of LightThemeMenu in the application.
class LightThemeMenuState extends Equatable {
  LightThemeMenuState({
    this.isSelectedSwitch = false,
    this.lightThemeMenuModelObj,
  });

  LightThemeMenuModel? lightThemeMenuModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        lightThemeMenuModelObj,
      ];

  LightThemeMenuState copyWith({
    bool? isSelectedSwitch,
    LightThemeMenuModel? lightThemeMenuModelObj,
  }) {
    return LightThemeMenuState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      lightThemeMenuModelObj:
          lightThemeMenuModelObj ?? this.lightThemeMenuModelObj,
    );
  }
}
