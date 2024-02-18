// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [new_password_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NewPasswordModel extends Equatable {
  NewPasswordModel() {}

  NewPasswordModel copyWith() {
    return NewPasswordModel();
  }

  @override
  List<Object?> get props => [];
}
