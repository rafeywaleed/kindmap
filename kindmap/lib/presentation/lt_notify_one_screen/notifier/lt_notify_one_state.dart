// ignore_for_file: must_be_immutable

part of 'lt_notify_one_notifier.dart';

/// Represents the state of LtNotifyOne in the application.
class LtNotifyOneState extends Equatable {
  LtNotifyOneState({this.ltNotifyOneModelObj});

  LtNotifyOneModel? ltNotifyOneModelObj;

  @override
  List<Object?> get props => [
        ltNotifyOneModelObj,
      ];

  LtNotifyOneState copyWith({LtNotifyOneModel? ltNotifyOneModelObj}) {
    return LtNotifyOneState(
      ltNotifyOneModelObj: ltNotifyOneModelObj ?? this.ltNotifyOneModelObj,
    );
  }
}
