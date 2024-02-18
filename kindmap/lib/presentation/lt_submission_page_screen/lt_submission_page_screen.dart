import 'notifier/lt_submission_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/app_bar/appbar_leading_image.dart';
import 'package:kindmap/widgets/app_bar/appbar_subtitle_seven.dart';
import 'package:kindmap/widgets/app_bar/appbar_title_image.dart';
import 'package:kindmap/widgets/app_bar/custom_app_bar.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_icon_button.dart';
import 'package:kindmap/widgets/custom_outlined_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class LtSubmissionPageScreen extends ConsumerStatefulWidget {
  const LtSubmissionPageScreen({Key? key}) : super(key: key);

  @override
  LtSubmissionPageScreenState createState() => LtSubmissionPageScreenState();
}

class LtSubmissionPageScreenState
    extends ConsumerState<LtSubmissionPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      theme.colorScheme.errorContainer,
                      appTheme.deepOrange200,
                      appTheme.whiteA70001
                    ])),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.h, vertical: 19.v),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 18.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: 170.adaptSize,
                                        width: 170.adaptSize,
                                        decoration: BoxDecoration(
                                            color: appTheme.blueGray10005,
                                            borderRadius:
                                                BorderRadius.circular(10.h),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  spreadRadius: 2.h,
                                                  blurRadius: 2.h,
                                                  offset: Offset(10, 10))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.h, top: 123.v),
                                        child: CustomIconButton(
                                            height: 47.adaptSize,
                                            width: 47.adaptSize,
                                            padding: EdgeInsets.all(2.h),
                                            onTap: () {
                                              onTapBtnRetakeButton(context);
                                            },
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRetakeButton)))
                                  ]))),
                      SizedBox(height: 27.v),
                      Container(
                          width: 333.h,
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 21.v),
                          decoration: AppDecoration.fillBluegray10005.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 5.h),
                                    child: Text("lbl_add_a_note".tr,
                                        style: CustomTextStyles
                                            .titleLargePrimary20)),
                                SizedBox(height: 5.v),
                                _buildAddANote(context),
                                SizedBox(height: 14.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text("msg_location_details".tr,
                                        style: CustomTextStyles
                                            .titleLargePrimary20)),
                                SizedBox(height: 3.v),
                                _buildLocation(context),
                                SizedBox(height: 15.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 3.h),
                                    child: Text("lbl_timer".tr,
                                        style: CustomTextStyles
                                            .titleLargePrimary20)),
                                Container(
                                    width: 291.h,
                                    margin:
                                        EdgeInsets.only(left: 5.h, right: 20.h),
                                    child: Text("msg_set_the_time_when".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .titleSmallGray70004)),
                                SizedBox(height: 1.v),
                                _buildDefault3Hrs(context),
                                SizedBox(height: 25.v),
                                _buildSubmit(context),
                                SizedBox(height: 6.v)
                              ])),
                      SizedBox(height: 8.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 72.v,
        leadingWidth: 38.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray8000229x20,
            margin: EdgeInsets.only(left: 18.h, top: 18.v, bottom: 25.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: Row(children: [
          AppbarTitleImage(imagePath: ImageConstant.imgKindmapJustLogo),
          AppbarSubtitleSeven(
              text: "lbl_kindmap".tr,
              margin: EdgeInsets.only(top: 7.v, bottom: 1.v))
        ]),
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildAddANote(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              controller:
                  ref.watch(ltSubmissionPageNotifier).addANoteController,
              hintText: "msg_ex_food_money_optional".tr,
              maxLines: 4,
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL101);
        }));
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 23.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              controller:
                  ref.watch(ltSubmissionPageNotifier).locationController,
              hintText: "lbl_optional".tr,
              textInputAction: TextInputAction.done,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 6.h, vertical: 20.v),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL101);
        }));
  }

  /// Section Widget
  Widget _buildDefault3Hrs(BuildContext context) {
    return CustomElevatedButton(
        height: 51.v,
        text: "lbl_default_3_hrs".tr,
        margin: EdgeInsets.only(right: 24.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1);
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomOutlinedButton(
        width: 156.h, text: "lbl_submit".tr, alignment: Alignment.center);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the ltCameraScreen when the action is triggered.
  onTapBtnRetakeButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.ltCameraScreen,
    );
  }
}
