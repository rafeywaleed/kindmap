import 'notifier/intro_screen_four_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';

class IntroScreenFourScreen extends ConsumerStatefulWidget {
  const IntroScreenFourScreen({Key? key}) : super(key: key);

  @override
  IntroScreenFourScreenState createState() => IntroScreenFourScreenState();
}

class IntroScreenFourScreenState extends ConsumerState<IntroScreenFourScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.deepPurple100,
            body: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 33.h, vertical: 105.v),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftPrimary,
                          height: 37.v,
                          width: 26.h,
                          margin: EdgeInsets.only(left: 9.h, top: 563.v),
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      GestureDetector(
                          onTap: () {
                            onTapTxtDone(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(top: 556.v, bottom: 6.v),
                              child: Text("lbl_done".tr,
                                  style:
                                      CustomTextStyles.headlineLargePrimary)))
                    ]))));
  }

  /// Navigates to the introScreenThreeScreen when the action is triggered.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introScreenThreeScreen,
    );
  }

  /// Navigates to the lightThemeScreen when the action is triggered.
  onTapTxtDone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.lightThemeScreen,
    );
  }
}
