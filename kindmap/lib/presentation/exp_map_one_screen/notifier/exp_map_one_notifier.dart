import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/exp_map_one_screen/models/exp_map_one_model.dart';
part 'exp_map_one_state.dart';

final expMapOneNotifier =
    StateNotifierProvider<ExpMapOneNotifier, ExpMapOneState>((ref) =>
        ExpMapOneNotifier(ExpMapOneState(expMapOneModelObj: ExpMapOneModel())));

/// A notifier that manages the state of a ExpMapOne according to the event that is dispatched to it.
class ExpMapOneNotifier extends StateNotifier<ExpMapOneState> {
  ExpMapOneNotifier(ExpMapOneState state) : super(state);
}
