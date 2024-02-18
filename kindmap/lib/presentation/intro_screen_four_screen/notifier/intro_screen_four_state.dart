// ignore_for_file: must_be_immutable

part of 'intro_screen_four_notifier.dart';

/// Represents the state of IntroScreenFour in the application.
class IntroScreenFourState extends Equatable {
  IntroScreenFourState({this.introScreenFourModelObj});

  IntroScreenFourModel? introScreenFourModelObj;

  @override
  List<Object?> get props => [
        introScreenFourModelObj,
      ];

  IntroScreenFourState copyWith(
      {IntroScreenFourModel? introScreenFourModelObj}) {
    return IntroScreenFourState(
      introScreenFourModelObj:
          introScreenFourModelObj ?? this.introScreenFourModelObj,
    );
  }
}
