// ignore_for_file: must_be_immutable

part of 'dt_dir_dst_preview_post_notifier.dart';

/// Represents the state of DtDirDstPreviewPost in the application.
class DtDirDstPreviewPostState extends Equatable {
  DtDirDstPreviewPostState({this.dtDirDstPreviewPostModelObj});

  DtDirDstPreviewPostModel? dtDirDstPreviewPostModelObj;

  @override
  List<Object?> get props => [
        dtDirDstPreviewPostModelObj,
      ];

  DtDirDstPreviewPostState copyWith(
      {DtDirDstPreviewPostModel? dtDirDstPreviewPostModelObj}) {
    return DtDirDstPreviewPostState(
      dtDirDstPreviewPostModelObj:
          dtDirDstPreviewPostModelObj ?? this.dtDirDstPreviewPostModelObj,
    );
  }
}
