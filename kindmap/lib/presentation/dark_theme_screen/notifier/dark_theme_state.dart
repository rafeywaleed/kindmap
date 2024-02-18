// ignore_for_file: must_be_immutable

part of 'dark_theme_notifier.dart';

/// Represents the state of DarkTheme in the application.
class DarkThemeState extends Equatable {
  DarkThemeState({this.darkThemeModelObj});

  DarkThemeModel? darkThemeModelObj;

  @override
  List<Object?> get props => [
        darkThemeModelObj,
      ];

  DarkThemeState copyWith({DarkThemeModel? darkThemeModelObj}) {
    return DarkThemeState(
      darkThemeModelObj: darkThemeModelObj ?? this.darkThemeModelObj,
    );
  }
}
