import 'notifier/dt_settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_outlined_button.dart';
import 'package:kindmap/widgets/custom_switch.dart';

class DtSettingsScreen extends ConsumerStatefulWidget {
  const DtSettingsScreen({Key? key}) : super(key: key);

  @override
  DtSettingsScreenState createState() => DtSettingsScreenState();
}

class DtSettingsScreenState extends ConsumerState<DtSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 34.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNotificationRow(context),
                      SizedBox(height: 8.v),
                      Text("lbl_profile".tr,
                          style: CustomTextStyles.titleLargeWhiteA70001_1),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("msg_set_a_new_password".tr,
                              style: CustomTextStyles.titleSmallBluegray10006)),
                      SizedBox(height: 17.v),
                      Text("lbl_permissions".tr,
                          style: CustomTextStyles.titleLargeWhiteA70001_1),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("msg_location_and_camera".tr,
                              style: CustomTextStyles.titleSmallBluegray10006)),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildLogoutButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 41.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray50,
            margin: EdgeInsets.only(left: 21.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarSubtitleFour(
              text: "lbl_settings".tr,
              margin: EdgeInsets.fromLTRB(25.h, 12.v, 25.h, 15.v))
        ]);
  }

  /// Section Widget
  Widget _buildNotificationRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("lbl_notification".tr,
                    style: CustomTextStyles.titleLargeWhiteA70001_1),
                SizedBox(height: 4.v),
                Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Text("lbl_blah_blah_blah".tr,
                        style: CustomTextStyles.titleSmallBluegray10006))
              ]),
              Consumer(builder: (context, ref, _) {
                return CustomSwitch(
                    margin: EdgeInsets.only(top: 3.v, bottom: 9.v),
                    value: ref.watch(dtSettingsNotifier).isSelectedSwitch,
                    onChange: (value) {
                      ref
                          .read(dtSettingsNotifier.notifier)
                          .changeSwitchBox1(value);
                    });
              })
            ]));
  }

  /// Section Widget
  Widget _buildLogoutButton(BuildContext context) {
    return CustomOutlinedButton(
        height: 59.v,
        text: "lbl_logout".tr,
        margin: EdgeInsets.only(left: 34.h, right: 31.h, bottom: 25.v),
        buttonStyle: CustomButtonStyles.outlineGray,
        buttonTextStyle: theme.textTheme.headlineLarge!,
        onPressed: () {
          onTapLogoutButton(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the logInPageScreen when the action is triggered.
  onTapLogoutButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInPageScreen,
    );
  }
}
