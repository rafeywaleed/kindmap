// ignore_for_file: must_be_immutable

part of 'dt_profile_notifier.dart';

/// Represents the state of DtProfile in the application.
class DtProfileState extends Equatable {
  DtProfileState({this.dtProfileModelObj});

  DtProfileModel? dtProfileModelObj;

  @override
  List<Object?> get props => [
        dtProfileModelObj,
      ];

  DtProfileState copyWith({DtProfileModel? dtProfileModelObj}) {
    return DtProfileState(
      dtProfileModelObj: dtProfileModelObj ?? this.dtProfileModelObj,
    );
  }
}
