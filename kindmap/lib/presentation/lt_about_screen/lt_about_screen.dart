import 'notifier/lt_about_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class LtAboutScreen extends ConsumerStatefulWidget {
  const LtAboutScreen({Key? key}) : super(key: key);

  @override
  LtAboutScreenState createState() => LtAboutScreenState();
}

class LtAboutScreenState extends ConsumerState<LtAboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray50, body: _buildAppBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: SizeUtils.height,
        leadingWidth: 41.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 25.v, bottom: 757.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitleThree(
            text: "lbl_about".tr,
            margin: EdgeInsets.only(left: 90.h, top: 20.v, bottom: 759.v)),
        styleType: Style.bgFill);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
