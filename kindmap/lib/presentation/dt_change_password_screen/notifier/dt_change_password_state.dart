// ignore_for_file: must_be_immutable

part of 'dt_change_password_notifier.dart';

/// Represents the state of DtChangePassword in the application.
class DtChangePasswordState extends Equatable {
  DtChangePasswordState({
    this.oldPasswordEditTextController,
    this.newPasswordEditTextController,
    this.confirmPasswordEditTextController,
    this.dtChangePasswordModelObj,
  });

  TextEditingController? oldPasswordEditTextController;

  TextEditingController? newPasswordEditTextController;

  TextEditingController? confirmPasswordEditTextController;

  DtChangePasswordModel? dtChangePasswordModelObj;

  @override
  List<Object?> get props => [
        oldPasswordEditTextController,
        newPasswordEditTextController,
        confirmPasswordEditTextController,
        dtChangePasswordModelObj,
      ];

  DtChangePasswordState copyWith({
    TextEditingController? oldPasswordEditTextController,
    TextEditingController? newPasswordEditTextController,
    TextEditingController? confirmPasswordEditTextController,
    DtChangePasswordModel? dtChangePasswordModelObj,
  }) {
    return DtChangePasswordState(
      oldPasswordEditTextController:
          oldPasswordEditTextController ?? this.oldPasswordEditTextController,
      newPasswordEditTextController:
          newPasswordEditTextController ?? this.newPasswordEditTextController,
      confirmPasswordEditTextController: confirmPasswordEditTextController ??
          this.confirmPasswordEditTextController,
      dtChangePasswordModelObj:
          dtChangePasswordModelObj ?? this.dtChangePasswordModelObj,
    );
  }
}
