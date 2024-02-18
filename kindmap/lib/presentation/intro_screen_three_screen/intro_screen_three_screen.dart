import 'notifier/intro_screen_three_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';

class IntroScreenThreeScreen extends ConsumerStatefulWidget {
  const IntroScreenThreeScreen({Key? key}) : super(key: key);

  @override
  IntroScreenThreeScreenState createState() => IntroScreenThreeScreenState();
}

class IntroScreenThreeScreenState
    extends ConsumerState<IntroScreenThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.pink100,
            body: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 18.h, vertical: 105.v),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftPrimary,
                          height: 37.v,
                          width: 26.h,
                          margin: EdgeInsets.only(left: 24.h, top: 563.v),
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 37.v,
                          width: 26.h,
                          margin: EdgeInsets.only(top: 562.v),
                          onTap: () {
                            onTapImgArrowRight(context);
                          })
                    ]))));
  }

  /// Navigates to the introScreenTwoScreen when the action is triggered.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introScreenTwoScreen,
    );
  }

  /// Navigates to the introScreenFourScreen when the action is triggered.
  onTapImgArrowRight(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introScreenFourScreen,
    );
  }
}
