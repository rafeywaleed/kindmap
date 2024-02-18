import 'dart:async';
import 'notifier/light_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_seven.dart';
import 'package:kindmap/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_icon_button.dart';

class LightThemeScreen extends ConsumerStatefulWidget {
  const LightThemeScreen({Key? key}) : super(key: key);

  @override
  LightThemeScreenState createState() => LightThemeScreenState();
}

// ignore_for_file: must_be_immutable
class LightThemeScreenState extends ConsumerState<LightThemeScreen> {
  Completer<GoogleMapController> googleMapController = Completer();

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
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      appTheme.whiteA70001,
                      appTheme.gray50,
                      appTheme.deepOrange50
                    ])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 6.h),
                    child: Column(children: [
                      _buildMap(context),
                      _buildDepthFrameTwo(context),
                      SizedBox(height: 31.v),
                      _buildPinContainer(context),
                      SizedBox(height: 17.v),
                      _buildTwentyFour(context),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 72.v,
        leadingWidth: 50.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgKindmapJustLogo,
            margin: EdgeInsets.only(left: 7.h, top: 24.v, bottom: 16.v)),
        title: AppbarSubtitleSeven(text: "lbl_kindmap".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLMenuButton,
              margin: EdgeInsets.fromLTRB(15.h, 16.v, 15.h, 8.v))
        ],
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildMap(BuildContext context) {
    return SizedBox(
        height: 196.v,
        width: 358.h,
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }

  /// Section Widget
  Widget _buildDepthFrameTwo(BuildContext context) {
    return SizedBox(
        height: 73.v,
        width: 358.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 72.v, width: 297.h, decoration: BoxDecoration())),
          CustomElevatedButton(
              width: 358.h,
              text: "msg_spot_people_nearby".tr,
              buttonStyle: CustomButtonStyles.fillRed,
              buttonTextStyle: CustomTextStyles.titleMediumGray100,
              alignment: Alignment.bottomCenter)
        ]));
  }

  /// Section Widget
  Widget _buildPinContainer(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22.h, right: 7.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_pin_someone".tr,
              style: CustomTextStyles.displayMediumStaatliches),
          CustomIconButton(
              height: 51.v,
              width: 50.h,
              padding: EdgeInsets.all(11.h),
              decoration: IconButtonStyleHelper.outlinePrimaryTL25,
              onTap: () {
                onTapBtnCamera(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgCamera))
        ]));
  }

  /// Section Widget
  Widget _buildTwentyFour(BuildContext context) {
    return Container(
        width: 345.h,
        margin: EdgeInsets.symmetric(horizontal: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 26.v),
        decoration: AppDecoration.outlinePrimary3
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text("lbl_spot_an_area".tr,
                      style: CustomTextStyles.titleLargePoppinsGray90004)),
              SizedBox(height: 1.v),
              Opacity(
                  opacity: 0.8,
                  child: Container(
                      width: 301.h,
                      margin: EdgeInsets.only(left: 1.h, right: 16.h),
                      child: Text("msg_spot_an_area_where".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallGray700a2
                              .copyWith(height: 1.50)))),
              SizedBox(height: 12.v),
              Text("lbl_notify_me".tr,
                  style: CustomTextStyles.titleLargePoppinsGray90004),
              SizedBox(height: 2.v),
              Opacity(
                  opacity: 0.8,
                  child: Container(
                      width: 254.h,
                      margin: EdgeInsets.only(right: 64.h),
                      child: Text("msg_get_a_notification".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallGray700a2
                              .copyWith(height: 1.50)))),
              SizedBox(height: 2.v)
            ]));
  }

  /// Navigates to the ltCameraScreen when the action is triggered.
  onTapBtnCamera(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.ltCameraScreen,
    );
  }
}
