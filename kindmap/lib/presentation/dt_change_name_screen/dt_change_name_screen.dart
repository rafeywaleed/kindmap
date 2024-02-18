import 'notifier/dt_change_name_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class DtChangeNameScreen extends ConsumerStatefulWidget {
  const DtChangeNameScreen({Key? key}) : super(key: key);

  @override
  DtChangeNameScreenState createState() => DtChangeNameScreenState();
}

class DtChangeNameScreenState extends ConsumerState<DtChangeNameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 25.h, top: 71.v, right: 25.h),
                child: Column(children: [
                  Container(
                      height: 150.adaptSize,
                      width: 150.adaptSize,
                      decoration: BoxDecoration(
                          color: appTheme.whiteA70001,
                          borderRadius: BorderRadius.circular(75.h))),
                  SizedBox(height: 21.v),
                  Text("lbl_user_full_name".tr,
                      style: CustomTextStyles.titleLargeGray40007),
                  SizedBox(height: 44.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("msg_enter_new_name".tr,
                              style:
                                  CustomTextStyles.titleLargeBluegray10002))),
                  Consumer(builder: (context, ref, _) {
                    return CustomTextFormField(
                        controller: ref
                            .watch(dtChangeNameNotifier)
                            .newNamePlaceholderController,
                        textInputAction: TextInputAction.done,
                        borderDecoration:
                            TextFormFieldStyleHelper.outlinePrimaryTL102,
                        fillColor: appTheme.blueGray400);
                  }),
                  SizedBox(height: 31.v),
                  CustomElevatedButton(
                      height: 59.v,
                      text: "lbl_change_name".tr,
                      margin: EdgeInsets.only(left: 7.h, right: 8.h),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL151,
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
          AppbarSubtitleOne(
              text: "lbl_change_name".tr,
              margin: EdgeInsets.fromLTRB(19.h, 12.v, 19.h, 11.v))
        ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
