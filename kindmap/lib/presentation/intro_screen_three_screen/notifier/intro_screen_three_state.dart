// ignore_for_file: must_be_immutable

part of 'intro_screen_three_notifier.dart';

/// Represents the state of IntroScreenThree in the application.
class IntroScreenThreeState extends Equatable {
  IntroScreenThreeState({this.introScreenThreeModelObj});

  IntroScreenThreeModel? introScreenThreeModelObj;

  @override
  List<Object?> get props => [
        introScreenThreeModelObj,
      ];

  IntroScreenThreeState copyWith(
      {IntroScreenThreeModel? introScreenThreeModelObj}) {
    return IntroScreenThreeState(
      introScreenThreeModelObj:
          introScreenThreeModelObj ?? this.introScreenThreeModelObj,
    );
  }
}
