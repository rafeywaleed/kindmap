import 'notifier/exp_map_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_seven.dart';
import 'package:kindmap/widgets/app_bar/appbar_title_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class ExpMapScreen extends ConsumerStatefulWidget {
  const ExpMapScreen({Key? key}) : super(key: key);

  @override
  ExpMapScreenState createState() => ExpMapScreenState();
}

class ExpMapScreenState extends ConsumerState<ExpMapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.pink100,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 33.h, vertical: 116.v),
                        decoration: AppDecoration.outlinePrimary1.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder20,
                            image: DecorationImage(
                                image: AssetImage(ImageConstant.imgMap492x358),
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
                            ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 72.v,
        leadingWidth: 33.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray90003,
            margin: EdgeInsets.only(left: 13.h, top: 21.v, bottom: 21.v),
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

  /// Navigates to the ltDirDstPreviewPostScreen when the action is triggered.
  onTapImgPinned(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.ltDirDstPreviewPostScreen,
    );
  }
}
