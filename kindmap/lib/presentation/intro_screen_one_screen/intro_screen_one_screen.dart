import 'notifier/intro_screen_one_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';

class IntroScreenOneScreen extends ConsumerStatefulWidget {
  const IntroScreenOneScreen({Key? key}) : super(key: key);

  @override
  IntroScreenOneScreenState createState() => IntroScreenOneScreenState();
}

class IntroScreenOneScreenState extends ConsumerState<IntroScreenOneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.indigo100,
            body: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 45.h, vertical: 111.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 37.v,
                          width: 26.h,
                          onTap: () {
                            onTapImgArrowRight(context);
                          })
                    ]))));
  }

  /// Navigates to the introScreenTwoScreen when the action is triggered.
  onTapImgArrowRight(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introScreenTwoScreen,
    );
  }
}
