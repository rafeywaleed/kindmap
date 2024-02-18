// ignore_for_file: must_be_immutable

part of 'lt_change_name_one_notifier.dart';

/// Represents the state of LtChangeNameOne in the application.
class LtChangeNameOneState extends Equatable {
  LtChangeNameOneState({
    this.oldPasswordEditTextController,
    this.newPasswordEditTextController,
    this.confirmPasswordEditTextController,
    this.ltChangeNameOneModelObj,
  });

  TextEditingController? oldPasswordEditTextController;

  TextEditingController? newPasswordEditTextController;

  TextEditingController? confirmPasswordEditTextController;

  LtChangeNameOneModel? ltChangeNameOneModelObj;

  @override
  List<Object?> get props => [
        oldPasswordEditTextController,
        newPasswordEditTextController,
        confirmPasswordEditTextController,
        ltChangeNameOneModelObj,
      ];

  LtChangeNameOneState copyWith({
    TextEditingController? oldPasswordEditTextController,
    TextEditingController? newPasswordEditTextController,
    TextEditingController? confirmPasswordEditTextController,
    LtChangeNameOneModel? ltChangeNameOneModelObj,
  }) {
    return LtChangeNameOneState(
      oldPasswordEditTextController:
          oldPasswordEditTextController ?? this.oldPasswordEditTextController,
      newPasswordEditTextController:
          newPasswordEditTextController ?? this.newPasswordEditTextController,
      confirmPasswordEditTextController: confirmPasswordEditTextController ??
          this.confirmPasswordEditTextController,
      ltChangeNameOneModelObj:
          ltChangeNameOneModelObj ?? this.ltChangeNameOneModelObj,
    );
  }
}
