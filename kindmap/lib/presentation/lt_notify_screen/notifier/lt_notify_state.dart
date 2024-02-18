// ignore_for_file: must_be_immutable

part of 'lt_notify_notifier.dart';

/// Represents the state of LtNotify in the application.
class LtNotifyState extends Equatable {
  LtNotifyState({this.ltNotifyModelObj});

  LtNotifyModel? ltNotifyModelObj;

  @override
  List<Object?> get props => [
        ltNotifyModelObj,
      ];

  LtNotifyState copyWith({LtNotifyModel? ltNotifyModelObj}) {
    return LtNotifyState(
      ltNotifyModelObj: ltNotifyModelObj ?? this.ltNotifyModelObj,
    );
  }
}
