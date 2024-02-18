import 'notifier/lt_notify_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class LtNotifyScreen extends ConsumerStatefulWidget {
  const LtNotifyScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LtNotifyScreenState createState() => LtNotifyScreenState();
}

class LtNotifyScreenState extends ConsumerState<LtNotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.blueGray50,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 35.h,
            vertical: 37.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.v),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 199.v,
                  width: 227.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10005,
                  ),
                ),
              ),
              SizedBox(height: 32.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "msg_work_in_progress".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 1.v),
              Container(
                width: 295.h,
                margin: EdgeInsets.only(left: 8.h),
                child: Text(
                  "msg_due_to_some_unfortunate".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumBluegray900.copyWith(
                    height: 1.25,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 48.h),
                child: Text(
                  "msg_sorry_for_the_inconvenience".tr,
                  style: CustomTextStyles.titleSmallPrimaryBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 374.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVector,
        margin: EdgeInsets.fromLTRB(21.h, 13.v, 333.h, 13.v),
      ),
    );
  }
}
