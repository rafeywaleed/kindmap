// ignore_for_file: must_be_immutable

part of 'lt_profile_notifier.dart';

/// Represents the state of LtProfile in the application.
class LtProfileState extends Equatable {
  LtProfileState({this.ltProfileModelObj});

  LtProfileModel? ltProfileModelObj;

  @override
  List<Object?> get props => [
        ltProfileModelObj,
      ];

  LtProfileState copyWith({LtProfileModel? ltProfileModelObj}) {
    return LtProfileState(
      ltProfileModelObj: ltProfileModelObj ?? this.ltProfileModelObj,
    );
  }
}
