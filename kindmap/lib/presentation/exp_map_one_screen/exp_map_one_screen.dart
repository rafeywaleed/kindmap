import 'dart:async';
import 'notifier/exp_map_one_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_six.dart';
import 'package:kindmap/widgets/app_bar/appbar_title_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class ExpMapOneScreen extends ConsumerStatefulWidget {
  const ExpMapOneScreen({Key? key}) : super(key: key);

  @override
  ExpMapOneScreenState createState() => ExpMapOneScreenState();
}

// ignore_for_file: must_be_immutable
class ExpMapOneScreenState extends ConsumerState<ExpMapOneScreen> {
  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray90001,
            appBar: _buildAppBar(context),
            body: SizedBox(
                height: 749.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  _buildMap(context),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 33.h, vertical: 116.v),
                          decoration: AppDecoration.outlinePrimary7.copyWith(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageConstant.imgMap492x358),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgPinned,
                                    height: 103.v,
                                    width: 89.h,
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.only(right: 61.h),
                                    onTap: () {
                                      onTapImgPinned(context);
                                    }),
                                SizedBox(height: 27.v),
                                SizedBox(
                                    width: 135.h,
                                    child: Text("msg_expanded_map_showing".tr,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(height: 1.25))),
                                SizedBox(height: 27.v)
                              ])))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 34.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray500,
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
  Widget _buildMap(BuildContext context) {
    return SizedBox(
        height: 750.v,
        width: double.maxFinite,
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

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the dtDirDstPreviewPostScreen when the action is triggered.
  onTapImgPinned(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dtDirDstPreviewPostScreen,
    );
  }
}
