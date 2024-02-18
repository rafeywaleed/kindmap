import 'dart:async';
import 'notifier/dark_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_six.dart';
import 'package:kindmap/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_icon_button.dart';

class DarkThemeScreen extends ConsumerStatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  DarkThemeScreenState createState() => DarkThemeScreenState();
}

// ignore_for_file: must_be_immutable
class DarkThemeScreenState extends ConsumerState<DarkThemeScreen> {
  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray90001,
            appBar: _buildAppBar(context),
            body: SizedBox(
                height: 753.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          height: 687.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgDbg,
                                    height: 687.v,
                                    width: 375.h,
                                    alignment: Alignment.center),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.h,
                                            right: 8.h,
                                            bottom: 45.v),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomElevatedButton(
                                                  text: "msg_spot_people_nearby"
                                                      .tr,
                                                  buttonStyle:
                                                      CustomButtonStyles
                                                          .fillWhiteA,
                                                  buttonTextStyle:
                                                      CustomTextStyles
                                                          .titleMediumRed500),
                                              SizedBox(height: 27.v),
                                              _buildPinContainer(context),
                                              SizedBox(height: 17.v),
                                              _buildTwentyOne(context)
                                            ])))
                              ]))),
                  _buildMap(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgKindmapJustLogo,
            margin: EdgeInsets.only(left: 11.h, top: 12.v, bottom: 12.v)),
        title: AppbarSubtitleSix(text: "lbl_kindmap".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenuButton,
              margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 4.v))
        ]);
  }

  /// Section Widget
  Widget _buildPinContainer(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 6.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_pin_someone".tr,
              style: CustomTextStyles.displayMediumStaatlichesWhiteA70001),
          CustomIconButton(
              height: 51.v,
              width: 50.h,
              padding: EdgeInsets.all(11.h),
              decoration: IconButtonStyleHelper.outlinePrimaryTL251,
              onTap: () {
                onTapBtnCamera(context);
              },
              child: CustomImageView(
                  imagePath: ImageConstant.imgCameraWhiteA70001))
        ]));
  }

  /// Section Widget
  Widget _buildTwentyOne(BuildContext context) {
    return Container(
        width: 345.h,
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 26.v),
        decoration: AppDecoration.outlineSecondaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text("lbl_spot_an_area".tr,
                      style: CustomTextStyles.titleLargePoppinsWhiteA70001)),
              SizedBox(height: 1.v),
              Opacity(
                  opacity: 0.8,
                  child: Container(
                      width: 301.h,
                      margin: EdgeInsets.only(left: 1.h, right: 16.h),
                      child: Text("msg_spot_an_area_where".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!
                              .copyWith(height: 1.50)))),
              SizedBox(height: 12.v),
              Text("lbl_notify_me".tr,
                  style: CustomTextStyles.titleLargePoppinsWhiteA70001),
              SizedBox(height: 2.v),
              Opacity(
                  opacity: 0.8,
                  child: Container(
                      width: 254.h,
                      margin: EdgeInsets.only(right: 64.h),
                      child: Text("msg_get_a_notification".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!
                              .copyWith(height: 1.50)))),
              SizedBox(height: 2.v)
            ]));
  }

  /// Section Widget
  Widget _buildMap(BuildContext context) {
    return Container(
        height: 196.v,
        width: 358.h,
        margin: EdgeInsets.only(top: 8.v),
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

  /// Navigates to the dtCameraScreen when the action is triggered.
  onTapBtnCamera(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dtCameraScreen,
    );
  }
}
