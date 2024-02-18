import 'notifier/lt_camera_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_seven.dart';
import 'package:kindmap/widgets/app_bar/appbar_title_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class LtCameraScreen extends ConsumerStatefulWidget {
  const LtCameraScreen({Key? key}) : super(key: key);

  @override
  LtCameraScreenState createState() => LtCameraScreenState();
}

class LtCameraScreenState extends ConsumerState<LtCameraScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: _buildAppBar(context),
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: theme.colorScheme.primary.withOpacity(1),
                        width: 1.h),
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                          appTheme.pink100,
                          appTheme.deepOrange10001,
                          appTheme.whiteA70001
                        ])),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.h, vertical: 51.v),
                    child: Column(children: [
                      SizedBox(height: 44.v),
                      OutlineGradientButton(
                          padding: EdgeInsets.only(
                              left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
                          strokeWidth: 1.h,
                          gradient: LinearGradient(
                              begin: Alignment(0.5, 0),
                              end: Alignment(0.5, 1),
                              colors: [
                                appTheme.pink100,
                                appTheme.gray400,
                                appTheme.whiteA70001
                              ]),
                          corners: Corners(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: Container(
                              height: 330.adaptSize,
                              width: 330.adaptSize,
                              decoration: BoxDecoration(
                                  color: appTheme.blueGray10005,
                                  borderRadius: BorderRadius.circular(20.h),
                                  boxShadow: [
                                    BoxShadow(
                                        color: theme.colorScheme.primary,
                                        spreadRadius: 2.h,
                                        blurRadius: 2.h,
                                        offset: Offset(0, 10))
                                  ]))),
                      SizedBox(height: 29.v),
                      GestureDetector(
                          onTap: () {
                            onTapCaptureButton(context);
                          },
                          child: Container(
                              height: 104.v,
                              width: 106.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.h, vertical: 1.v),
                              decoration: AppDecoration.outlinePrimary2
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder53),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgAperture,
                                  height: 101.v,
                                  width: 94.h,
                                  alignment: Alignment.center))),
                      SizedBox(height: 54.v),
                      Container(
                          width: 307.h,
                          margin: EdgeInsets.only(left: 12.h, right: 10.h),
                          child: Text("msg_click_a_picture".tr,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.titleSmallPoppinsGray800
                                  .copyWith(height: 1.20)))
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 72.v,
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray80002,
            margin: EdgeInsets.only(left: 20.h, top: 21.v, bottom: 22.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: Row(children: [
          AppbarTitleImage(imagePath: ImageConstant.imgKindmapJustLogo),
          AppbarSubtitleSeven(
              text: "lbl_kindmap".tr,
              margin: EdgeInsets.only(top: 7.v, bottom: 1.v))
        ]),
        styleType: Style.bgFill_1);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the ltSubmissionPageScreen when the action is triggered.
  onTapCaptureButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.ltSubmissionPageScreen,
    );
  }
}
