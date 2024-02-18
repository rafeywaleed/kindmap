import 'notifier/dt_change_password_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_title.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class DtChangePasswordScreen extends ConsumerStatefulWidget {
  const DtChangePasswordScreen({Key? key}) : super(key: key);

  @override
  DtChangePasswordScreenState createState() => DtChangePasswordScreenState();
}

class DtChangePasswordScreenState
    extends ConsumerState<DtChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 30.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.v),
                      Container(
                          height: 150.adaptSize,
                          width: 150.adaptSize,
                          decoration: BoxDecoration(
                              color: appTheme.blueA100,
                              borderRadius: BorderRadius.circular(75.h))),
                      SizedBox(height: 22.v),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("lbl_user_full_name".tr,
                              style: CustomTextStyles.titleLargeBluegray10003)),
                      SizedBox(height: 73.v),
                      Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text("lbl_old_password".tr,
                              style: CustomTextStyles
                                  .titleLargeWhiteA70001Regular)),
                      _buildOldPasswordEditText(context),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text("lbl_new_password".tr,
                              style: CustomTextStyles
                                  .titleLargeWhiteA70001Regular)),
                      _buildNewPasswordEditText(context),
                      SizedBox(height: 10.v),
                      Container(
                          height: 64.v,
                          width: 237.h,
                          margin: EdgeInsets.only(left: 5.h),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            _buildConfirmPasswordEditText(context),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text("msg_confirm_password".tr,
                                    style: CustomTextStyles
                                        .titleLargeWhiteA70001Regular))
                          ])),
                      Spacer(),
                      _buildDoneButton(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 41.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 11.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: "lbl_change_password".tr,
            margin: EdgeInsets.only(left: 109.h)));
  }

  /// Section Widget
  Widget _buildOldPasswordEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 91.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              controller: ref
                  .watch(dtChangePasswordNotifier)
                  .oldPasswordEditTextController,
              obscureText: true,
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL10,
              fillColor: appTheme.blueGray10001);
        }));
  }

  /// Section Widget
  Widget _buildNewPasswordEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 91.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              controller: ref
                  .watch(dtChangePasswordNotifier)
                  .newPasswordEditTextController,
              obscureText: true,
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL10,
              fillColor: appTheme.blueGray10001);
        }));
  }

  /// Section Widget
  Widget _buildConfirmPasswordEditText(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return CustomTextFormField(
          width: 237.h,
          controller: ref
              .watch(dtChangePasswordNotifier)
              .confirmPasswordEditTextController,
          textInputAction: TextInputAction.done,
          alignment: Alignment.bottomCenter,
          obscureText: true,
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL10,
          fillColor: appTheme.blueGray10001);
    });
  }

  /// Section Widget
  Widget _buildDoneButton(BuildContext context) {
    return CustomElevatedButton(
        height: 59.v,
        text: "lbl_done".tr,
        margin: EdgeInsets.only(left: 5.h, right: 18.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL151,
        buttonTextStyle: theme.textTheme.headlineLarge!);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
