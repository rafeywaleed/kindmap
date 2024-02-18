// ignore_for_file: must_be_immutable

part of 'lt_submission_page_notifier.dart';

/// Represents the state of LtSubmissionPage in the application.
class LtSubmissionPageState extends Equatable {
  LtSubmissionPageState({
    this.addANoteController,
    this.locationController,
    this.ltSubmissionPageModelObj,
  });

  TextEditingController? addANoteController;

  TextEditingController? locationController;

  LtSubmissionPageModel? ltSubmissionPageModelObj;

  @override
  List<Object?> get props => [
        addANoteController,
        locationController,
        ltSubmissionPageModelObj,
      ];

  LtSubmissionPageState copyWith({
    TextEditingController? addANoteController,
    TextEditingController? locationController,
    LtSubmissionPageModel? ltSubmissionPageModelObj,
  }) {
    return LtSubmissionPageState(
      addANoteController: addANoteController ?? this.addANoteController,
      locationController: locationController ?? this.locationController,
      ltSubmissionPageModelObj:
          ltSubmissionPageModelObj ?? this.ltSubmissionPageModelObj,
    );
  }
}
