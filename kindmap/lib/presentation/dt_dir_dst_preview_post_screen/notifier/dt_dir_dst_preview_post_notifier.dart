import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/dt_dir_dst_preview_post_screen/models/dt_dir_dst_preview_post_model.dart';
part 'dt_dir_dst_preview_post_state.dart';

final dtDirDstPreviewPostNotifier = StateNotifierProvider<
        DtDirDstPreviewPostNotifier, DtDirDstPreviewPostState>(
    (ref) => DtDirDstPreviewPostNotifier(DtDirDstPreviewPostState(
        dtDirDstPreviewPostModelObj: DtDirDstPreviewPostModel())));

/// A notifier that manages the state of a DtDirDstPreviewPost according to the event that is dispatched to it.
class DtDirDstPreviewPostNotifier
    extends StateNotifier<DtDirDstPreviewPostState> {
  DtDirDstPreviewPostNotifier(DtDirDstPreviewPostState state) : super(state);
}
