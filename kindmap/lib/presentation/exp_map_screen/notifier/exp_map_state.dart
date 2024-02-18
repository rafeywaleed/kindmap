// ignore_for_file: must_be_immutable

part of 'exp_map_notifier.dart';

/// Represents the state of ExpMap in the application.
class ExpMapState extends Equatable {
  ExpMapState({this.expMapModelObj});

  ExpMapModel? expMapModelObj;

  @override
  List<Object?> get props => [
        expMapModelObj,
      ];

  ExpMapState copyWith({ExpMapModel? expMapModelObj}) {
    return ExpMapState(
      expMapModelObj: expMapModelObj ?? this.expMapModelObj,
    );
  }
}
