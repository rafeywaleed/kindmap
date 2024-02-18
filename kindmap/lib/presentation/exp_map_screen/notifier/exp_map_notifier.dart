import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/exp_map_screen/models/exp_map_model.dart';
part 'exp_map_state.dart';

final expMapNotifier = StateNotifierProvider<ExpMapNotifier, ExpMapState>(
    (ref) => ExpMapNotifier(ExpMapState(expMapModelObj: ExpMapModel())));

/// A notifier that manages the state of a ExpMap according to the event that is dispatched to it.
class ExpMapNotifier extends StateNotifier<ExpMapState> {
  ExpMapNotifier(ExpMapState state) : super(state);
}
