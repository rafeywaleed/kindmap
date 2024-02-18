import 'notifier/dt_about_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class DtAboutScreen extends ConsumerStatefulWidget {
  const DtAboutScreen({Key? key}) : super(key: key);

  @override
  DtAboutScreenState createState() => DtAboutScreenState();
}

class DtAboutScreenState extends ConsumerState<DtAboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _buildAppBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: SizeUtils.height,
        leadingWidth: 41.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray40006,
            margin: EdgeInsets.only(left: 21.h, top: 25.v, bottom: 757.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_about".tr,
            margin: EdgeInsets.only(left: 90.h, top: 20.v, bottom: 759.v)),
        styleType: Style.bgFill_3);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
