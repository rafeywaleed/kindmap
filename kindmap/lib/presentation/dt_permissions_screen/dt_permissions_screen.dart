import 'notifier/dt_permissions_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_switch.dart';

class DtPermissionsScreen extends ConsumerStatefulWidget {
  const DtPermissionsScreen({Key? key}) : super(key: key);

  @override
  DtPermissionsScreenState createState() => DtPermissionsScreenState();
}

class DtPermissionsScreenState extends ConsumerState<DtPermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 22.v),
                child: Column(children: [
                  _buildArrowLeftPermissions(context),
                  SizedBox(height: 69.v),
                  _buildLocationPermission(context),
                  SizedBox(height: 16.v),
                  _buildCameraToClickAPicture(context),
                  SizedBox(height: 16.v)
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeftPermissions(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 5.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 29.v,
              width: 20.h,
              margin: EdgeInsets.only(top: 2.v),
              onTap: () {
                onTapImgArrowLeft(context);
              }),
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("lbl_permissions".tr,
                  style: CustomTextStyles.titleLargeGray50))
        ]));
  }

  /// Section Widget
  Widget _buildLocationPermission(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("lbl_location".tr,
                    style: CustomTextStyles.titleLargeGray50),
                SizedBox(height: 1.v),
                Container(
                    width: 249.h,
                    margin: EdgeInsets.only(left: 9.h),
                    child: Text("msg_used_when_you_pin".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleSmallBluegray10001
                            .copyWith(height: 1.20)))
              ])),
          Consumer(builder: (context, ref, _) {
            return CustomSwitch(
                margin: EdgeInsets.only(left: 37.h, top: 3.v, bottom: 47.v),
                value: ref.watch(dtPermissionsNotifier).isSelectedSwitch,
                onChange: (value) {
                  ref
                      .read(dtPermissionsNotifier.notifier)
                      .changeSwitchBox1(value);
                });
          })
        ]);
  }

  /// Section Widget
  Widget _buildCameraToClickAPicture(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("lbl_camera".tr, style: CustomTextStyles.titleLargeGray50),
                SizedBox(height: 5.v),
                Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Text("msg_to_click_a_picture".tr,
                        style: CustomTextStyles.titleSmallBluegray10001))
              ]),
              Consumer(builder: (context, ref, _) {
                return CustomSwitch(
                    margin: EdgeInsets.only(top: 3.v, bottom: 11.v),
                    value: ref.watch(dtPermissionsNotifier).isSelectedSwitch1,
                    onChange: (value) {
                      ref
                          .read(dtPermissionsNotifier.notifier)
                          .changeSwitchBox2(value);
                    });
              })
            ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
