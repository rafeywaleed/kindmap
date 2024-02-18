// ignore_for_file: must_be_immutable

part of 'dt_change_name_notifier.dart';

/// Represents the state of DtChangeName in the application.
class DtChangeNameState extends Equatable {
  DtChangeNameState({
    this.newNamePlaceholderController,
    this.dtChangeNameModelObj,
  });

  TextEditingController? newNamePlaceholderController;

  DtChangeNameModel? dtChangeNameModelObj;

  @override
  List<Object?> get props => [
        newNamePlaceholderController,
        dtChangeNameModelObj,
      ];

  DtChangeNameState copyWith({
    TextEditingController? newNamePlaceholderController,
    DtChangeNameModel? dtChangeNameModelObj,
  }) {
    return DtChangeNameState(
      newNamePlaceholderController:
          newNamePlaceholderController ?? this.newNamePlaceholderController,
      dtChangeNameModelObj: dtChangeNameModelObj ?? this.dtChangeNameModelObj,
    );
  }
}
