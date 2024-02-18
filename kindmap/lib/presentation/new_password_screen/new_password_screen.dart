import 'notifier/new_password_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class NewPasswordScreen extends ConsumerStatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  NewPasswordScreenState createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends ConsumerState<NewPasswordScreen> {
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
                          SizedBox(height: 81.v),
                          Padding(
                              padding: EdgeInsets.only(right: 5.h),
                              child: Consumer(builder: (context, ref, _) {
                                return CustomTextFormField(
                                  controller: ref
                                      .watch(newPasswordNotifier)
                                      .newPasswordAgainController,
                                  hintText: "New Password",
                                );
                              })),
                          SizedBox(height: 29.v),
                          Padding(
                              padding: EdgeInsets.only(right: 5.h),
                              child: Consumer(builder: (context, ref, _) {
                                return CustomTextFormField(
                                    controller: ref
                                        .watch(newPasswordNotifier)
                                        .newPasswordController,
                                    hintText: "Confirm Password",
                                    textInputAction: TextInputAction.done,
                                    obscureText: true);
                              })),
                          SizedBox(height: 81.v),
                          CustomElevatedButton(
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(left: 8.h, right: 1.h),
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

  /// Navigates to the logInPageScreen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInPageScreen,
    );
  }

  /// Navigates to the verifyEmailScreen when the action is triggered.
  onTapTxtBack(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.verifyEmailScreen,
    );
  }
}
