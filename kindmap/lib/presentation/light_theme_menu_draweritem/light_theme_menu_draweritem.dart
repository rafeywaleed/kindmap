import 'notifier/light_theme_menu_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_switch.dart';

class LightThemeMenuDraweritem extends ConsumerStatefulWidget {
  const LightThemeMenuDraweritem({Key? key}) : super(key: key);

  @override
  LightThemeMenuDraweritemState createState() =>
      LightThemeMenuDraweritemState();
}

class LightThemeMenuDraweritemState
    extends ConsumerState<LightThemeMenuDraweritem> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: appTheme.pink100,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: appTheme.red300, width: 3.h),
                borderRadius: BorderRadiusStyle.customBorderTL18),
            child: Container(
                height: SizeUtils.height,
                width: 305.h,
                decoration: AppDecoration.outlineRed
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL18),
                child: Stack(alignment: Alignment.centerLeft, children: [
                  Opacity(
                      opacity: 0.15,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgMenubarimg,
                          height: 812.v,
                          width: 305.h,
                          radius: BorderRadius.horizontal(
                              left: Radius.circular(18.h)),
                          alignment: Alignment.center)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(19.h, 21.v, 103.h, 45.v),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 101.v,
                                    width: 100.h,
                                    decoration: BoxDecoration(
                                        color: appTheme.whiteA70001,
                                        borderRadius:
                                            BorderRadius.circular(50.h))),
                                SizedBox(height: 22.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 7.h),
                                    child: Text("lbl_user_name_here".tr,
                                        style: CustomTextStyles
                                            .titleLargeWhiteA70001)),
                                Spacer(flex: 53),
                                GestureDetector(
                                    onTap: () {
                                      onTapSettingsButton(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 7.h),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgSettingIcon,
                                                  height: 35.v,
                                                  width: 36.h,
                                                  margin: EdgeInsets.only(
                                                      bottom: 5.v)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 9.h),
                                                  child: Text("lbl_settings".tr,
                                                      style: CustomTextStyles
                                                          .headlineLarge32))
                                            ]))),
                                SizedBox(height: 38.v),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 7.h, right: 2.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgContactIcon,
                                                  height: 41.adaptSize,
                                                  width: 41.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 2.v)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 4.h, bottom: 2.v),
                                                  child: Text("lbl_contact".tr,
                                                      style: CustomTextStyles
                                                          .headlineLarge32))
                                            ]))),
                                SizedBox(height: 38.v),
                                GestureDetector(
                                    onTap: () {
                                      onTapAboutButton(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 7.h, right: 32.h),
                                        child: Row(children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgAboutIcon,
                                              height: 33.adaptSize,
                                              width: 33.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 5.v, bottom: 2.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 11.h),
                                              child: Text("lbl_about".tr,
                                                  style: CustomTextStyles
                                                      .headlineLarge32))
                                        ]))),
                                Spacer(flex: 46),
                                Consumer(builder: (context, ref, _) {
                                  return CustomSwitch(
                                      margin: EdgeInsets.only(left: 15.h),
                                      value: ref
                                          .watch(lightThemeMenuNotifier)
                                          .isSelectedSwitch,
                                      onChange: (value) {
                                        ref
                                            .read(
                                                lightThemeMenuNotifier.notifier)
                                            .changeSwitchBox1(value);
                                      });
                                })
                              ])))
                ]))));
  }

  /// Navigates to the ltSettingsScreen when the action is triggered.
  onTapSettingsButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.ltSettingsScreen,
    );
  }

  /// Navigates to the ltAboutScreen when the action is triggered.
  onTapAboutButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.ltAboutScreen,
    );
  }
}
