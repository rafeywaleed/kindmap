// ignore_for_file: must_be_immutable

part of 'dark_theme_menu_notifier.dart';

/// Represents the state of DarkThemeMenu in the application.
class DarkThemeMenuState extends Equatable {
  DarkThemeMenuState({this.darkThemeMenuModelObj});

  DarkThemeMenuModel? darkThemeMenuModelObj;

  @override
  List<Object?> get props => [
        darkThemeMenuModelObj,
      ];

  DarkThemeMenuState copyWith({DarkThemeMenuModel? darkThemeMenuModelObj}) {
    return DarkThemeMenuState(
      darkThemeMenuModelObj:
          darkThemeMenuModelObj ?? this.darkThemeMenuModelObj,
    );
  }
}
