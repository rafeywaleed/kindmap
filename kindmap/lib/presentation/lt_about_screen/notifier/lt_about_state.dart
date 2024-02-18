// ignore_for_file: must_be_immutable

part of 'lt_about_notifier.dart';

/// Represents the state of LtAbout in the application.
class LtAboutState extends Equatable {
  LtAboutState({this.ltAboutModelObj});

  LtAboutModel? ltAboutModelObj;

  @override
  List<Object?> get props => [
        ltAboutModelObj,
      ];

  LtAboutState copyWith({LtAboutModel? ltAboutModelObj}) {
    return LtAboutState(
      ltAboutModelObj: ltAboutModelObj ?? this.ltAboutModelObj,
    );
  }
}
