import 'notifier/log_in_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';
import 'package:kindmap/domain/googleauth/google_auth_helper.dart';

class LogInPageScreen extends ConsumerStatefulWidget {
  const LogInPageScreen({Key? key}) : super(key: key);

  @override
  LogInPageScreenState createState() => LogInPageScreenState();
}

class LogInPageScreenState extends ConsumerState<LogInPageScreen> {
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
                        EdgeInsets.symmetric(horizontal: 17.h, vertical: 16.v),
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
                      SizedBox(height: 15.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("lbl_welcome_back".tr,
                              style: CustomTextStyles
                                  .headlineLargeSmoochSansPrimary)),
                      SizedBox(height: 3.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("msg_blah_blah_blah_blah".tr,
                              style: CustomTextStyles
                                  .titleLargeSmoochSansPrimary)),
                      SizedBox(height: 41.v),
                      _buildEmailField(context),
                      SizedBox(height: 24.v),
                      _buildPasswordField(context),
                      SizedBox(height: 23.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtForgetPassword(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(right: 10.h),
                                  child: Text("msg_forget_password".tr,
                                      style: CustomTextStyles
                                          .titleSmallPrimary)))),
                      SizedBox(height: 9.v),
                      _buildLoginButton(context),
                      SizedBox(height: 12.v),
                      Text("lbl_or".tr,
                          style: CustomTextStyles.headlineSmallBluegray700),
                      SizedBox(height: 12.v),
                      _buildGoogleSignInButton(context),
                      SizedBox(height: 5.v)
                    ]))),
            bottomNavigationBar: _buildSignupSection(context)));
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 10.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(logInPageNotifier).emailFieldController,
            hintText: "E-mail",
          );
        }));
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 10.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              controller: ref.watch(logInPageNotifier).passwordFieldController,
              hintText: "Password",
              textInputAction: TextInputAction.done,
              obscureText: true);
        }));
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
        height: 44.v,
        text: "lbl_log_in".tr,
        margin: EdgeInsets.only(left: 13.h, right: 18.h),
        onPressed: () {
          onTapLoginButton(context);
        });
  }

  /// Section Widget
  Widget _buildGoogleSignInButton(BuildContext context) {
    return CustomElevatedButton(
        height: 65.v,
        text: "msg_sign_in_with_google".tr,
        margin: EdgeInsets.only(left: 13.h, right: 10.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL20,
        onPressed: () {
          onTapGoogleSignInButton(context);
        });
  }

  /// Section Widget
  Widget _buildSignupSection(BuildContext context) {
    return Container(
        height: 50.v,
        width: 322.h,
        margin: EdgeInsets.only(left: 22.h, right: 30.h, bottom: 29.v),
        child: Stack(alignment: Alignment.topRight, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 240.h,
                  child: Text("msg_new_to_kind_map".tr,
                      maxLines: null,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.headlineSmallBlack900))),
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    onTapTxtSignUp(context);
                  },
                  child: Text("lbl_sign_up2".tr,
                      style: CustomTextStyles.headlineSmallDeeporangeA400)))
        ]));
  }

  /// Navigates to the verifyEmailScreen when the action is triggered.
  onTapTxtForgetPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.verifyEmailScreen,
    );
  }

  /// Navigates to the introScreenOneScreen when the action is triggered.
  onTapLoginButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.introScreenOneScreen,
    );
  }

  onTapGoogleSignInButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the signUpPageScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpPageScreen,
    );
  }
}
