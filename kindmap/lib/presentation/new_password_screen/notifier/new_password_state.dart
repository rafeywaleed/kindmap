// ignore_for_file: must_be_immutable

part of 'new_password_notifier.dart';

/// Represents the state of NewPassword in the application.
class NewPasswordState extends Equatable {
  NewPasswordState({
    this.newPasswordAgainController,
    this.newPasswordController,
    this.newPasswordModelObj,
  });

  TextEditingController? newPasswordAgainController;

  TextEditingController? newPasswordController;

  NewPasswordModel? newPasswordModelObj;

  @override
  List<Object?> get props => [
        newPasswordAgainController,
        newPasswordController,
        newPasswordModelObj,
      ];

  NewPasswordState copyWith({
    TextEditingController? newPasswordAgainController,
    TextEditingController? newPasswordController,
    NewPasswordModel? newPasswordModelObj,
  }) {
    return NewPasswordState(
      newPasswordAgainController:
          newPasswordAgainController ?? this.newPasswordAgainController,
      newPasswordController:
          newPasswordController ?? this.newPasswordController,
      newPasswordModelObj: newPasswordModelObj ?? this.newPasswordModelObj,
    );
  }
}
