// ignore_for_file: must_be_immutable

part of 'dt_submission_page_notifier.dart';

/// Represents the state of DtSubmissionPage in the application.
class DtSubmissionPageState extends Equatable {
  DtSubmissionPageState({
    this.locationController,
    this.dtSubmissionPageModelObj,
  });

  TextEditingController? locationController;

  DtSubmissionPageModel? dtSubmissionPageModelObj;

  @override
  List<Object?> get props => [
        locationController,
        dtSubmissionPageModelObj,
      ];

  DtSubmissionPageState copyWith({
    TextEditingController? locationController,
    DtSubmissionPageModel? dtSubmissionPageModelObj,
  }) {
    return DtSubmissionPageState(
      locationController: locationController ?? this.locationController,
      dtSubmissionPageModelObj:
          dtSubmissionPageModelObj ?? this.dtSubmissionPageModelObj,
    );
  }
}
