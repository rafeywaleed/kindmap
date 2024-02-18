// ignore_for_file: must_be_immutable

part of 'dt_about_notifier.dart';

/// Represents the state of DtAbout in the application.
class DtAboutState extends Equatable {
  DtAboutState({this.dtAboutModelObj});

  DtAboutModel? dtAboutModelObj;

  @override
  List<Object?> get props => [
        dtAboutModelObj,
      ];

  DtAboutState copyWith({DtAboutModel? dtAboutModelObj}) {
    return DtAboutState(
      dtAboutModelObj: dtAboutModelObj ?? this.dtAboutModelObj,
    );
  }
}
