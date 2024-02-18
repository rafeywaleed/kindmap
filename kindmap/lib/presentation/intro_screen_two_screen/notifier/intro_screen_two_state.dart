// ignore_for_file: must_be_immutable

part of 'intro_screen_two_notifier.dart';

/// Represents the state of IntroScreenTwo in the application.
class IntroScreenTwoState extends Equatable {
  IntroScreenTwoState({this.introScreenTwoModelObj});

  IntroScreenTwoModel? introScreenTwoModelObj;

  @override
  List<Object?> get props => [
        introScreenTwoModelObj,
      ];

  IntroScreenTwoState copyWith({IntroScreenTwoModel? introScreenTwoModelObj}) {
    return IntroScreenTwoState(
      introScreenTwoModelObj:
          introScreenTwoModelObj ?? this.introScreenTwoModelObj,
    );
  }
}
