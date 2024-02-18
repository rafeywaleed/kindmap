import 'notifier/lt_dir_dst_preview_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_seven.dart';
import 'package:kindmap/widgets/app_bar/appbar_title_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class LtDirDstPreviewPostScreen extends ConsumerStatefulWidget {
  const LtDirDstPreviewPostScreen({Key? key}) : super(key: key);

  @override
  LtDirDstPreviewPostScreenState createState() =>
      LtDirDstPreviewPostScreenState();
}

class LtDirDstPreviewPostScreenState
    extends ConsumerState<LtDirDstPreviewPostScreen> {
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
                        height: 757.v,
                        width: 358.h,
                        margin: EdgeInsets.only(left: 7.h, right: 10.h),
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 33.h, vertical: 151.v),
                                  decoration: AppDecoration.outlinePrimary1
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder20,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ImageConstant.imgMap492x358),
                                              fit: BoxFit.cover)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 95.v),
                                        SizedBox(
                                            width: 179.h,
                                            child: Text(
                                                "msg_this_will_have_preview".tr,
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(height: 1.25)))
                                      ]))),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 33.h),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildOnePinTile(context),
                                        SizedBox(height: 63.v),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text("lbl_report".tr,
                                                style:
                                                    theme.textTheme.bodyLarge))
                                      ])))
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 72.v,
        leadingWidth: 34.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray900,
            margin: EdgeInsets.only(left: 14.h, top: 25.v, bottom: 17.v),
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

  /// Section Widget
  Widget _buildOnePinTile(BuildContext context) {
    return Container(
        width: 262.h,
        margin: EdgeInsets.only(right: 62.h),
        padding: EdgeInsets.symmetric(horizontal: 107.h, vertical: 11.v),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup1), fit: BoxFit.cover)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 275.v),
              Text("lbl_time".tr, style: theme.textTheme.titleMedium)
            ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
