// ignore_for_file: must_be_immutable

part of 'lt_dir_dst_preview_post_notifier.dart';

/// Represents the state of LtDirDstPreviewPost in the application.
class LtDirDstPreviewPostState extends Equatable {
  LtDirDstPreviewPostState({this.ltDirDstPreviewPostModelObj});

  LtDirDstPreviewPostModel? ltDirDstPreviewPostModelObj;

  @override
  List<Object?> get props => [
        ltDirDstPreviewPostModelObj,
      ];

  LtDirDstPreviewPostState copyWith(
      {LtDirDstPreviewPostModel? ltDirDstPreviewPostModelObj}) {
    return LtDirDstPreviewPostState(
      ltDirDstPreviewPostModelObj:
          ltDirDstPreviewPostModelObj ?? this.ltDirDstPreviewPostModelObj,
    );
  }
}
