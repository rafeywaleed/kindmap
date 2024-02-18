import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/area_map_screen/models/area_map_model.dart';
part 'area_map_state.dart';

final areaMapNotifier = StateNotifierProvider<AreaMapNotifier, AreaMapState>(
    (ref) => AreaMapNotifier(AreaMapState(areaMapModelObj: AreaMapModel())));

/// A notifier that manages the state of a AreaMap according to the event that is dispatched to it.
class AreaMapNotifier extends StateNotifier<AreaMapState> {
  AreaMapNotifier(AreaMapState state) : super(state);
}
