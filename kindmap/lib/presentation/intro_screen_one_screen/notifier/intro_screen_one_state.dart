// ignore_for_file: must_be_immutable

part of 'intro_screen_one_notifier.dart';

/// Represents the state of IntroScreenOne in the application.
class IntroScreenOneState extends Equatable {
  IntroScreenOneState({this.introScreenOneModelObj});

  IntroScreenOneModel? introScreenOneModelObj;

  @override
  List<Object?> get props => [
        introScreenOneModelObj,
      ];

  IntroScreenOneState copyWith({IntroScreenOneModel? introScreenOneModelObj}) {
    return IntroScreenOneState(
      introScreenOneModelObj:
          introScreenOneModelObj ?? this.introScreenOneModelObj,
    );
  }
}
