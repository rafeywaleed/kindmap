import 'notifier/dark_theme_menu_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_icon_button.dart';

class DarkThemeMenuScreen extends ConsumerStatefulWidget {
  const DarkThemeMenuScreen({Key? key}) : super(key: key);

  @override
  DarkThemeMenuScreenState createState() => DarkThemeMenuScreenState();
}

class DarkThemeMenuScreenState extends ConsumerState<DarkThemeMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 1.v),
                      Padding(
                          padding: EdgeInsets.only(left: 7.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 44.v, bottom: 713.v),
                                    child: CustomIconButton(
                                        height: 54.v,
                                        width: 55.h,
                                        padding: EdgeInsets.all(10.h),
                                        decoration:
                                            IconButtonStyleHelper.fillBlueGray,
                                        onTap: () {
                                          onTapBtnArrowLeft(context);
                                        },
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgArrowLeftOnprimary))),
                                Container(
                                    height: 811.v,
                                    width: 303.h,
                                    margin: EdgeInsets.only(left: 10.h),
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgMenubar,
                                              height: 811.v,
                                              width: 303.h,
                                              radius: BorderRadius.horizontal(
                                                  left: Radius.circular(18.h)),
                                              alignment: Alignment.center),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      19.h, 20.v, 118.h, 44.v),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            height: 101.v,
                                                            width: 100.h,
                                                            decoration: BoxDecoration(
                                                                color: appTheme
                                                                    .whiteA700,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.h))),
                                                        SizedBox(height: 22.v),
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                "lbl_user_name_here"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .titleLargeWhiteA700)),
                                                        Spacer(flex: 53),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapSettingsButton(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 7
                                                                            .h),
                                                                child: Row(
                                                                    children: [
                                                                      CustomImageView(
                                                                          imagePath: ImageConstant
                                                                              .imgSettingIconWhiteA700,
                                                                          height: 35
                                                                              .v,
                                                                          width: 36
                                                                              .h,
                                                                          radius:
                                                                              BorderRadius.horizontal(left: Radius.circular(18.h)),
                                                                          margin: EdgeInsets.only(bottom: 3.v)),
                                                                      Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 9
                                                                                  .h,
                                                                              top: 2
                                                                                  .v),
                                                                          child: Text(
                                                                              "lbl_settings".tr,
                                                                              style: theme.textTheme.headlineMedium))
                                                                    ]))),
                                                        SizedBox(height: 43.v),
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 7
                                                                            .h),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      CustomImageView(
                                                                          imagePath: ImageConstant
                                                                              .imgContactIconWhiteA700,
                                                                          height: 41
                                                                              .adaptSize,
                                                                          width: 41
                                                                              .adaptSize,
                                                                          radius:
                                                                              BorderRadius.horizontal(left: Radius.circular(20.h))),
                                                                      Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 4
                                                                                  .h,
                                                                              bottom: 4
                                                                                  .v),
                                                                          child: Text(
                                                                              "lbl_contact".tr,
                                                                              style: theme.textTheme.headlineMedium))
                                                                    ]))),
                                                        SizedBox(height: 41.v),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapAboutButton(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 8
                                                                            .h),
                                                                child: Row(
                                                                    children: [
                                                                      CustomImageView(
                                                                          imagePath: ImageConstant
                                                                              .imgAboutIconWhiteA700,
                                                                          height: 33
                                                                              .adaptSize,
                                                                          width: 33
                                                                              .adaptSize,
                                                                          radius:
                                                                              BorderRadius.horizontal(left: Radius.circular(16.h)),
                                                                          margin: EdgeInsets.only(top: 2.v)),
                                                                      Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 11
                                                                                  .h),
                                                                          child: Text(
                                                                              "lbl_about".tr,
                                                                              style: theme.textTheme.headlineMedium))
                                                                    ]))),
                                                        Spacer(flex: 46),
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgUser,
                                                            height: 52.v,
                                                            width: 92.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 15.h))
                                                      ])))
                                        ]))
                              ]))
                    ]))));
  }

  /// Navigates back to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the dtSettingsScreen when the action is triggered.
  onTapSettingsButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dtSettingsScreen,
    );
  }

  /// Navigates to the dtAboutScreen when the action is triggered.
  onTapAboutButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dtAboutScreen,
    );
  }
}
