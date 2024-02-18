import 'notifier/lt_permissions_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_switch.dart';

class LtPermissionsScreen extends ConsumerStatefulWidget {
  const LtPermissionsScreen({Key? key}) : super(key: key);

  @override
  LtPermissionsScreenState createState() => LtPermissionsScreenState();
}

class LtPermissionsScreenState extends ConsumerState<LtPermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 57.v),
                child: Column(children: [
                  _buildLocationPermissionRow1(context),
                  SizedBox(height: 16.v),
                  _buildLocationPermissionRow2(context),
                  SizedBox(height: 16.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 41.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 14.v, bottom: 12.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarSubtitleFive(
              text: "lbl_permissions".tr,
              margin: EdgeInsets.fromLTRB(17.h, 11.v, 17.h, 16.v))
        ]);
  }

  /// Section Widget
  Widget _buildLocationPermissionRow1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("lbl_location".tr, style: theme.textTheme.titleLarge),
                SizedBox(height: 1.v),
                Container(
                    width: 249.h,
                    margin: EdgeInsets.only(left: 9.h),
                    child: Text("msg_used_when_you_pin".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:
                            theme.textTheme.titleSmall!.copyWith(height: 1.20)))
              ])),
          Consumer(builder: (context, ref, _) {
            return CustomSwitch(
                margin: EdgeInsets.only(left: 37.h, top: 3.v, bottom: 47.v),
                value: ref.watch(ltPermissionsNotifier).isSelectedSwitch,
                onChange: (value) {
                  ref
                      .read(ltPermissionsNotifier.notifier)
                      .changeSwitchBox1(value);
                });
          })
        ]);
  }

  /// Section Widget
  Widget _buildLocationPermissionRow2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("lbl_camera".tr, style: theme.textTheme.titleLarge),
                SizedBox(height: 5.v),
                Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Text("msg_to_click_a_picture".tr,
                        style: theme.textTheme.titleSmall))
              ]),
              Consumer(builder: (context, ref, _) {
                return CustomSwitch(
                    margin: EdgeInsets.only(top: 3.v, bottom: 11.v),
                    value: ref.watch(ltPermissionsNotifier).isSelectedSwitch1,
                    onChange: (value) {
                      ref
                          .read(ltPermissionsNotifier.notifier)
                          .changeSwitchBox2(value);
                    });
              })
            ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
