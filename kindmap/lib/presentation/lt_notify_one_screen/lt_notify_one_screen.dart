import 'notifier/lt_notify_one_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';

class LtNotifyOneScreen extends ConsumerStatefulWidget {
  const LtNotifyOneScreen({Key? key}) : super(key: key);

  @override
  LtNotifyOneScreenState createState() => LtNotifyOneScreenState();
}

class LtNotifyOneScreenState extends ConsumerState<LtNotifyOneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftBlueGray100,
                          height: 29.v,
                          width: 20.h,
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      SizedBox(height: 65.v),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: 199.v,
                              width: 227.h,
                              decoration: BoxDecoration(
                                  color: appTheme.blueGray10005))),
                      SizedBox(height: 32.v),
                      Padding(
                          padding: EdgeInsets.only(left: 44.h),
                          child: Text("msg_work_in_progress".tr,
                              style: CustomTextStyles.titleLargeWhiteA70001_1)),
                      SizedBox(height: 1.v),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 295.h,
                              margin: EdgeInsets.only(left: 22.h, right: 13.h),
                              child: Text("msg_due_to_some_unfortunate".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleMediumWhiteA70001
                                      .copyWith(height: 1.25)))),
                      Spacer(),
                      SizedBox(height: 12.v),
                      Padding(
                          padding: EdgeInsets.only(left: 62.h),
                          child: Text("msg_sorry_for_the_inconvenience".tr,
                              style: CustomTextStyles.titleSmallGray40001))
                    ]))));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
