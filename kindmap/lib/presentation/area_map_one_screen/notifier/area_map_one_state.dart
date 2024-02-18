// ignore_for_file: must_be_immutable

part of 'area_map_one_notifier.dart';

/// Represents the state of AreaMapOne in the application.
class AreaMapOneState extends Equatable {
  AreaMapOneState({this.areaMapOneModelObj});

  AreaMapOneModel? areaMapOneModelObj;

  @override
  List<Object?> get props => [
        areaMapOneModelObj,
      ];

  AreaMapOneState copyWith({AreaMapOneModel? areaMapOneModelObj}) {
    return AreaMapOneState(
      areaMapOneModelObj: areaMapOneModelObj ?? this.areaMapOneModelObj,
    );
  }
}
