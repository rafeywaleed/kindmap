import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kindmap/presentation/lt_dir_dst_preview_post_screen/models/lt_dir_dst_preview_post_model.dart';
part 'lt_dir_dst_preview_post_state.dart';

final ltDirDstPreviewPostNotifier = StateNotifierProvider<
        LtDirDstPreviewPostNotifier, LtDirDstPreviewPostState>(
    (ref) => LtDirDstPreviewPostNotifier(LtDirDstPreviewPostState(
        ltDirDstPreviewPostModelObj: LtDirDstPreviewPostModel())));

/// A notifier that manages the state of a LtDirDstPreviewPost according to the event that is dispatched to it.
class LtDirDstPreviewPostNotifier
    extends StateNotifier<LtDirDstPreviewPostState> {
  LtDirDstPreviewPostNotifier(LtDirDstPreviewPostState state) : super(state);
}
