// ignore_for_file: must_be_immutable

part of 'light_theme_notifier.dart';

/// Represents the state of LightTheme in the application.
class LightThemeState extends Equatable {
  LightThemeState({this.lightThemeModelObj});

  LightThemeModel? lightThemeModelObj;

  @override
  List<Object?> get props => [
        lightThemeModelObj,
      ];

  LightThemeState copyWith({LightThemeModel? lightThemeModelObj}) {
    return LightThemeState(
      lightThemeModelObj: lightThemeModelObj ?? this.lightThemeModelObj,
    );
  }
}
