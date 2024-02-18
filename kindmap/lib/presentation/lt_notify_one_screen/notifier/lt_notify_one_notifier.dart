import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_notify_one_screen/models/lt_notify_one_model.dart';
part 'lt_notify_one_state.dart';

final ltNotifyOneNotifier =
    StateNotifierProvider<LtNotifyOneNotifier, LtNotifyOneState>((ref) =>
        LtNotifyOneNotifier(
            LtNotifyOneState(ltNotifyOneModelObj: LtNotifyOneModel())));

/// A notifier that manages the state of a LtNotifyOne according to the event that is dispatched to it.
class LtNotifyOneNotifier extends StateNotifier<LtNotifyOneState> {
  LtNotifyOneNotifier(LtNotifyOneState state) : super(state);
}
