import 'notifier/lt_change_name_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class LtChangeNameScreen extends ConsumerStatefulWidget {
  const LtChangeNameScreen({Key? key}) : super(key: key);

  @override
  LtChangeNameScreenState createState() => LtChangeNameScreenState();
}

class LtChangeNameScreenState extends ConsumerState<LtChangeNameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 25.h, top: 70.v, right: 25.h),
                child: Column(children: [
                  Container(
                      height: 150.adaptSize,
                      width: 150.adaptSize,
                      decoration: BoxDecoration(
                          color: appTheme.blueA100,
                          borderRadius: BorderRadius.circular(75.h))),
                  SizedBox(height: 22.v),
                  Text("lbl_user_full_name".tr,
                      style: CustomTextStyles.titleLargeGray70002),
                  SizedBox(height: 43.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("msg_enter_new_name".tr,
                              style: CustomTextStyles.titleLargePrimary20))),
                  Consumer(builder: (context, ref, _) {
                    return CustomTextFormField(
                        controller: ref
                            .watch(ltChangeNameNotifier)
                            .newNamePlaceholderController,
                        textInputAction: TextInputAction.done,
                        borderDecoration:
                            TextFormFieldStyleHelper.outlinePrimaryTL10,
                        fillColor: appTheme.blueGray10001);
                  }),
                  SizedBox(height: 31.v),
                  CustomElevatedButton(
                      height: 59.v,
                      text: "lbl_change_name".tr,
                      margin: EdgeInsets.only(left: 7.h, right: 8.h),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL15,
                      buttonTextStyle: theme.textTheme.headlineLarge!),
                  SizedBox(height: 5.v)
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
        actions: [
          AppbarSubtitleTwo(
              text: "lbl_change_name".tr,
              margin: EdgeInsets.fromLTRB(19.h, 12.v, 19.h, 11.v))
        ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
