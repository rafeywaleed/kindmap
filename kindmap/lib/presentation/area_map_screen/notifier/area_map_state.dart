// ignore_for_file: must_be_immutable

part of 'area_map_notifier.dart';

/// Represents the state of AreaMap in the application.
class AreaMapState extends Equatable {
  AreaMapState({this.areaMapModelObj});

  AreaMapModel? areaMapModelObj;

  @override
  List<Object?> get props => [
        areaMapModelObj,
      ];

  AreaMapState copyWith({AreaMapModel? areaMapModelObj}) {
    return AreaMapState(
      areaMapModelObj: areaMapModelObj ?? this.areaMapModelObj,
    );
  }
}
