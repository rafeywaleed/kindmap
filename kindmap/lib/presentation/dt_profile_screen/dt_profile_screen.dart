import 'notifier/dt_profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';

class DtProfileScreen extends ConsumerStatefulWidget {
  const DtProfileScreen({Key? key}) : super(key: key);

  @override
  DtProfileScreenState createState() => DtProfileScreenState();
}

class DtProfileScreenState extends ConsumerState<DtProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 18.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_change_name".tr,
                          style: CustomTextStyles.titleLargeWhiteA70001_1),
                      SizedBox(height: 1.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("lbl_blah_blah_blah".tr,
                              style: CustomTextStyles.titleSmallGray40005)),
                      SizedBox(height: 21.v),
                      Text("lbl_change_password".tr,
                          style: CustomTextStyles.titleLargeWhiteA70001_1),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("msg_set_a_new_password".tr,
                              style: CustomTextStyles.titleSmallGray40005)),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 41.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftOnprimarycontainer,
            margin: EdgeInsets.only(left: 21.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarSubtitleFour(
              text: "lbl_settings".tr,
              margin: EdgeInsets.fromLTRB(25.h, 12.v, 25.h, 15.v))
        ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
