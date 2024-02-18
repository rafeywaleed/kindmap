import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/area_map_one_screen/models/area_map_one_model.dart';
part 'area_map_one_state.dart';

final areaMapOneNotifier =
    StateNotifierProvider<AreaMapOneNotifier, AreaMapOneState>((ref) =>
        AreaMapOneNotifier(
            AreaMapOneState(areaMapOneModelObj: AreaMapOneModel())));

/// A notifier that manages the state of a AreaMapOne according to the event that is dispatched to it.
class AreaMapOneNotifier extends StateNotifier<AreaMapOneState> {
  AreaMapOneNotifier(AreaMapOneState state) : super(state);
}
