import 'notifier/verify_email_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  VerifyEmailScreenState createState() => VerifyEmailScreenState();
}

class VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    color: appTheme.whiteA70001,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgGroup84),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 21.h, vertical: 19.v),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 136.v,
                              width: 214.h,
                              margin: EdgeInsets.only(left: 32.h),
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 2.v),
                                            child: Text("lbl_kindmap".tr,
                                                style: theme
                                                    .textTheme.displayMedium))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgKindmapJustLogo,
                                        height: 75.v,
                                        width: 106.h,
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(right: 43.h)),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text("msg_connecting_hearts".tr,
                                            style: theme.textTheme.labelLarge))
                                  ])),
                          SizedBox(height: 56.v),
                          Text("msg_verify_your_email".tr,
                              style: CustomTextStyles.bodyLargeTelexPrimary),
                          SizedBox(height: 2.v),
                          Padding(
                              padding: EdgeInsets.only(right: 5.h),
                              child: Consumer(builder: (context, ref, _) {
                                return CustomTextFormField(
                                    controller: ref
                                        .watch(verifyEmailNotifier)
                                        .emailController,
                                    textInputAction: TextInputAction.done);
                              })),
                          SizedBox(height: 41.v),
                          CustomElevatedButton(
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(left: 5.h, right: 4.h),
                              onPressed: () {
                                onTapNext(context);
                              }),
                          Spacer(),
                          SizedBox(height: 31.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtBack(context);
                              },
                              child: Text("lbl_back".tr,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .headlineSmallDeeporangeA400))
                        ])))));
  }

  /// Navigates to the newPasswordScreen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.newPasswordScreen,
    );
  }

  /// Navigates to the logInPageScreen when the action is triggered.
  onTapTxtBack(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInPageScreen,
    );
  }
}
