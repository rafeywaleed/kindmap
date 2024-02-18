import 'notifier/dt_camera_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_six.dart';
import 'package:kindmap/widgets/app_bar/appbar_title_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class DtCameraScreen extends ConsumerStatefulWidget {
  const DtCameraScreen({Key? key}) : super(key: key);

  @override
  DtCameraScreenState createState() => DtCameraScreenState();
}

class DtCameraScreenState extends ConsumerState<DtCameraScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray90001,
            appBar: _buildAppBar(context),
            body: SizedBox(
                height: 749.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgDbg742x375,
                      height: 742.v,
                      width: 375.h,
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 22.h, right: 22.h, bottom: 51.v),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            _buildView(context),
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
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder53),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgAperture,
                                        height: 101.v,
                                        width: 94.h,
                                        alignment: Alignment.center))),
                            SizedBox(height: 54.v),
                            Container(
                                width: 307.h,
                                margin:
                                    EdgeInsets.only(left: 11.h, right: 10.h),
                                child: Text("msg_click_a_picture".tr,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .titleSmallPoppinsOnError
                                        .copyWith(height: 1.20)))
                          ])))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 34.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray40002,
            margin: EdgeInsets.only(left: 14.h, top: 10.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: Row(children: [
          AppbarTitleImage(imagePath: ImageConstant.imgKindmapJustLogo),
          AppbarSubtitleSix(
              text: "lbl_kindmap".tr,
              margin: EdgeInsets.only(top: 7.v, bottom: 1.v))
        ]));
  }

  /// Section Widget
  Widget _buildView(BuildContext context) {
    return OutlineGradientButton(
        padding: EdgeInsets.only(left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
        strokeWidth: 1.h,
        gradient: LinearGradient(
            begin: Alignment(0.5, 0),
            end: Alignment(0.5, 1),
            colors: [appTheme.pink100, appTheme.gray400, appTheme.whiteA70001]),
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
                ])));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the dtSubmissionPageScreen when the action is triggered.
  onTapCaptureButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dtSubmissionPageScreen,
    );
  }
}
