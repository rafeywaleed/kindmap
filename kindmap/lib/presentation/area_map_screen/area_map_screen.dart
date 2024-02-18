import 'notifier/area_map_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_six.dart';
import 'package:kindmap/widgets/app_bar/appbar_title_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class AreaMapScreen extends ConsumerStatefulWidget {
  const AreaMapScreen({Key? key}) : super(key: key);

  @override
  AreaMapScreenState createState() => AreaMapScreenState();
}

class AreaMapScreenState extends ConsumerState<AreaMapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray90001,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 33.h, vertical: 99.v),
                        decoration: AppDecoration.outlinePrimary1.copyWith(
                            image: DecorationImage(
                                image: AssetImage(ImageConstant.imgMap492x358),
                                fit: BoxFit.cover)),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      height: 125.v,
                                      width: 180.h,
                                      margin: EdgeInsets.only(right: 35.h),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: theme.colorScheme.primary
                                                  .withOpacity(1),
                                              width: 4.h)))),
                              SizedBox(height: 24.v),
                              Text("msg_spotting_area_on".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 24.v)
                            ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 63.v,
        leadingWidth: 33.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray600,
            margin: EdgeInsets.only(left: 13.h, top: 16.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: Row(children: [
          AppbarTitleImage(imagePath: ImageConstant.imgKindmapJustLogo),
          AppbarSubtitleSix(
              text: "lbl_kindmap".tr,
              margin: EdgeInsets.only(top: 6.v, bottom: 2.v))
        ]),
        styleType: Style.bgFill_2);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
