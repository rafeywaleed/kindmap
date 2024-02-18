// ignore_for_file: must_be_immutable

part of 'lt_change_name_notifier.dart';

/// Represents the state of LtChangeName in the application.
class LtChangeNameState extends Equatable {
  LtChangeNameState({
    this.newNamePlaceholderController,
    this.ltChangeNameModelObj,
  });

  TextEditingController? newNamePlaceholderController;

  LtChangeNameModel? ltChangeNameModelObj;

  @override
  List<Object?> get props => [
        newNamePlaceholderController,
        ltChangeNameModelObj,
      ];

  LtChangeNameState copyWith({
    TextEditingController? newNamePlaceholderController,
    LtChangeNameModel? ltChangeNameModelObj,
  }) {
    return LtChangeNameState(
      newNamePlaceholderController:
          newNamePlaceholderController ?? this.newNamePlaceholderController,
      ltChangeNameModelObj: ltChangeNameModelObj ?? this.ltChangeNameModelObj,
    );
  }
}
