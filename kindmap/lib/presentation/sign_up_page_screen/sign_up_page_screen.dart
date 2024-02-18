import 'notifier/sign_up_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class SignUpPageScreen extends ConsumerStatefulWidget {
  const SignUpPageScreen({Key? key}) : super(key: key);

  @override
  SignUpPageScreenState createState() => SignUpPageScreenState();
}

class SignUpPageScreenState extends ConsumerState<SignUpPageScreen> {
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
                        EdgeInsets.symmetric(horizontal: 21.h, vertical: 16.v),
                    child: Column(children: [
                      SizedBox(
                          height: 136.v,
                          width: 214.h,
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 2.v),
                                    child: Text("lbl_kindmap".tr,
                                        style: theme.textTheme.displayMedium))),
                            CustomImageView(
                                imagePath: ImageConstant.imgKindmapJustLogo,
                                height: 75.v,
                                width: 106.h,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 43.h)),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Text("msg_connecting_hearts".tr,
                                    style: theme.textTheme.labelLarge))
                          ])),
                      SizedBox(height: 26.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text("lbl_welcome".tr,
                                  style: CustomTextStyles
                                      .headlineLargeSmoochSansPrimary))),
                      SizedBox(height: 3.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text("msg_blah_blah_blah_blah".tr,
                                  style: CustomTextStyles
                                      .titleLargeSmoochSansPrimary))),
                      SizedBox(height: 12.v),
                      _buildFullName(context),
                      SizedBox(height: 23.v),
                      _buildEmail(context),

                      // Container(
                      //     height: 48.v,
                      //     width: 326.h,
                      //     decoration: BoxDecoration(
                      //         color: appTheme.whiteA70001,
                      //         borderRadius: BorderRadius.circular(20.h),
                      //         boxShadow: [
                      //           BoxShadow(
                      //               color: theme.colorScheme.primary,
                      //               spreadRadius: 2.h,
                      //               blurRadius: 2.h,
                      //               offset: Offset(10, 10))
                      //         ])),
                      SizedBox(height: 23.v),
                      _buildPassword(context),
                      SizedBox(height: 35.v),
                      _buildSignUp(context),
                      SizedBox(height: 15.v),
                      Text("lbl_or".tr,
                          style: CustomTextStyles.headlineSmallBluegray700),
                      SizedBox(height: 11.v),
                      _buildSignUpWithGoogle(context),
                      SizedBox(height: 5.v)
                    ]))),
            bottomNavigationBar: _buildEightyTwo(context)));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(signUpPageNotifier).fullNameController,
            hintText: "Full Name",
          );
        }));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(signUpPageNotifier).emailController,
            hintText: "Email",
          );
        }));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              controller: ref.watch(signUpPageNotifier).passwordController,
              textInputAction: TextInputAction.done,
              hintText: "Password",
              obscureText: true);
        }));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        margin: EdgeInsets.only(left: 8.h, right: 2.h),
        onPressed: () {
          onTapSignUp(context);
        });
  }

  /// Section Widget
  Widget _buildSignUpWithGoogle(BuildContext context) {
    return CustomElevatedButton(
        height: 65.v,
        text: "msg_sign_up_with_google".tr,
        margin: EdgeInsets.only(left: 11.h, right: 4.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL20);
  }

  /// Section Widget
  Widget _buildEightyTwo(BuildContext context) {
    return Container(
        height: 31.v,
        width: 257.h,
        margin: EdgeInsets.only(left: 51.h, right: 66.h, bottom: 34.v),
        child: Stack(alignment: Alignment.centerLeft, children: [
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(left: 189.h),
                  decoration: AppDecoration.outlinePrimary
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder20),
                  child: GestureDetector(
                      onTap: () {
                        onTapTxtLogIn(context);
                      },
                      child: Text("lbl_log_in".tr,
                          style: CustomTextStyles.headlineSmallRedA700)))),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("msg_already_a_user".tr,
                  style: CustomTextStyles.headlineSmallPrimary))
        ]));
  }

  /// Navigates to the introScreenOneScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introScreenOneScreen,
    );
  }

  /// Navigates to the logInPageScreen when the action is triggered.
  onTapTxtLogIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInPageScreen,
    );
  }
}
