import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_notify_screen/models/lt_notify_model.dart';
part 'lt_notify_state.dart';

final ltNotifyNotifier = StateNotifierProvider<LtNotifyNotifier, LtNotifyState>(
  (ref) => LtNotifyNotifier(LtNotifyState(
    ltNotifyModelObj: LtNotifyModel(),
  )),
);

/// A notifier that manages the state of a LtNotify according to the event that is dispatched to it.
class LtNotifyNotifier extends StateNotifier<LtNotifyState> {
  LtNotifyNotifier(LtNotifyState state) : super(state) {}
}
