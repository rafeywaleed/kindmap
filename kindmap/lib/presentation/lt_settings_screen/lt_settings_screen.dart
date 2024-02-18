import 'notifier/lt_settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_switch.dart';

class LtSettingsScreen extends ConsumerStatefulWidget {
  const LtSettingsScreen({Key? key}) : super(key: key);

  @override
  LtSettingsScreenState createState() => LtSettingsScreenState();
}

class LtSettingsScreenState extends ConsumerState<LtSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 34.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNotificationSetting(context),
                      SizedBox(height: 18.v),
                      Text("lbl_profile".tr, style: theme.textTheme.titleLarge),
                      SizedBox(height: 4.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("lbl_blah_blah_blah".tr,
                              style: theme.textTheme.titleSmall)),
                      SizedBox(height: 17.v),
                      Text("lbl_permissions".tr,
                          style: theme.textTheme.titleLarge),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("msg_location_and_camera".tr,
                              style: theme.textTheme.titleSmall)),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildLogout(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 41.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarSubtitleFive(
              text: "lbl_settings".tr,
              margin: EdgeInsets.fromLTRB(25.h, 12.v, 25.h, 15.v))
        ]);
  }

  /// Section Widget
  Widget _buildNotificationSetting(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("lbl_notification".tr, style: theme.textTheme.titleLarge),
                SizedBox(height: 4.v),
                Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Text("lbl_blah_blah_blah".tr,
                        style: theme.textTheme.titleSmall))
              ]),
              Consumer(builder: (context, ref, _) {
                return CustomSwitch(
                    margin: EdgeInsets.only(top: 3.v, bottom: 9.v),
                    value: ref.watch(ltSettingsNotifier).isSelectedSwitch,
                    onChange: (value) {
                      ref
                          .read(ltSettingsNotifier.notifier)
                          .changeSwitchBox1(value);
                    });
              })
            ]));
  }

  /// Section Widget
  Widget _buildLogout(BuildContext context) {
    return CustomElevatedButton(
        height: 59.v,
        text: "lbl_logout".tr,
        margin: EdgeInsets.only(left: 34.h, right: 31.h, bottom: 25.v),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL15,
        buttonTextStyle: theme.textTheme.headlineLarge!,
        onPressed: () {
          onTapLogout(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the logInPageScreen when the action is triggered.
  onTapLogout(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInPageScreen,
    );
  }
}
