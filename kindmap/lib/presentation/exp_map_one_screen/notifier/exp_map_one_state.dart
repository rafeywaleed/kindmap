// ignore_for_file: must_be_immutable

part of 'exp_map_one_notifier.dart';

/// Represents the state of ExpMapOne in the application.
class ExpMapOneState extends Equatable {
  ExpMapOneState({this.expMapOneModelObj});

  ExpMapOneModel? expMapOneModelObj;

  @override
  List<Object?> get props => [
        expMapOneModelObj,
      ];

  ExpMapOneState copyWith({ExpMapOneModel? expMapOneModelObj}) {
    return ExpMapOneState(
      expMapOneModelObj: expMapOneModelObj ?? this.expMapOneModelObj,
    );
  }
}
