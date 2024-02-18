import 'notifier/dt_submission_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';
import 'package:kindmap/widgets/custom_elevated_button.dart';
import 'package:kindmap/widgets/custom_outlined_button.dart';
import 'package:kindmap/widgets/custom_text_form_field.dart';

class DtSubmissionPageScreen extends ConsumerStatefulWidget {
  const DtSubmissionPageScreen({Key? key}) : super(key: key);

  @override
  DtSubmissionPageScreenState createState() => DtSubmissionPageScreenState();
}

class DtSubmissionPageScreenState
    extends ConsumerState<DtSubmissionPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray90001,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topLeft, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          height: 765.v,
                          width: double.maxFinite,
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgDbg765x375,
                                height: 765.v,
                                width: 375.h,
                                alignment: Alignment.center),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.h, right: 18.h),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 18.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                            height:
                                                                170.adaptSize,
                                                            width:
                                                                170.adaptSize,
                                                            decoration: BoxDecoration(
                                                                color: appTheme
                                                                    .blueGray10005,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.h),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .primary,
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              10,
                                                                              10))
                                                                ])),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapRetakeButton(
                                                                  context);
                                                            },
                                                            child: Container(
                                                                height: 47
                                                                    .adaptSize,
                                                                width: 47
                                                                    .adaptSize,
                                                                margin: EdgeInsets.only(
                                                                    left: 16.h,
                                                                    top: 123.v),
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        2.h),
                                                                decoration: AppDecoration
                                                                    .outlinePrimary4
                                                                    .copyWith(
                                                                        borderRadius: BorderRadiusStyle
                                                                            .roundedBorder23),
                                                                child: CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgRetakeButton,
                                                                    height: 41
                                                                        .adaptSize,
                                                                    width: 41
                                                                        .adaptSize,
                                                                    alignment: Alignment.center)))
                                                      ]))),
                                          SizedBox(height: 27.v),
                                          _buildSubmissionTile(context)
                                        ])))
                          ]))),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(14.h, 15.v, 129.h, 758.v),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgArrowLeftGray40002,
                                    height: 29.v,
                                    width: 20.h,
                                    margin: EdgeInsets.only(bottom: 8.v),
                                    onTap: () {
                                      onTapImgArrowLeft(context);
                                    }),
                                Spacer(),
                                CustomImageView(
                                    imagePath: ImageConstant.imgKindmapJustLogo,
                                    height: 32.v,
                                    width: 43.h,
                                    margin: EdgeInsets.only(top: 6.v)),
                                Padding(
                                    padding: EdgeInsets.only(top: 13.v),
                                    child: Text("lbl_kindmap".tr,
                                        style: CustomTextStyles
                                            .titleMediumGray50ed))
                              ])))
                ]))));
  }

  /// Section Widget
  Widget _buildSubmissionTile(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 20.v),
        decoration: AppDecoration.outlinePrimary5
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text("lbl_add_a_note".tr,
                      style: CustomTextStyles.titleLargePrimary20)),
              SizedBox(height: 6.v),
              Container(
                  width: 293.h,
                  margin: EdgeInsets.only(right: 22.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 9.h, vertical: 12.v),
                  decoration: AppDecoration.outlinePrimary6.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 21.v),
                        SizedBox(
                            width: 152.h,
                            child: Text("msg_ex_food_money_optional".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .titleLargePrimaryRegular20
                                    .copyWith(height: 1.13)))
                      ])),
              SizedBox(height: 7.v),
              Text("msg_location_details".tr,
                  style: CustomTextStyles.headlineSmallPrimary),
              SizedBox(height: 4.v),
              Padding(
                  padding: EdgeInsets.only(right: 22.h),
                  child: Consumer(builder: (context, ref, _) {
                    return CustomTextFormField(
                        controller: ref
                            .watch(dtSubmissionPageNotifier)
                            .locationController,
                        hintText: "lbl_optional".tr,
                        hintStyle: CustomTextStyles.titleLargePrimaryRegular20,
                        textInputAction: TextInputAction.done,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25.h, vertical: 16.v),
                        borderDecoration:
                            TextFormFieldStyleHelper.outlinePrimaryTL101);
                  })),
              SizedBox(height: 13.v),
              Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text("lbl_timer".tr,
                      style: CustomTextStyles.headlineSmallPrimary)),
              SizedBox(height: 1.v),
              Container(
                  width: 291.h,
                  margin: EdgeInsets.only(left: 5.h, right: 18.h),
                  child: Text("msg_set_the_time_when".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallGray90002)),
              SizedBox(height: 1.v),
              CustomElevatedButton(
                  height: 51.v,
                  text: "lbl_default_3_hrs".tr,
                  margin: EdgeInsets.only(right: 22.h),
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                  buttonTextStyle: CustomTextStyles.titleLargePrimary),
              SizedBox(height: 25.v),
              CustomOutlinedButton(
                  width: 156.h,
                  text: "lbl_submit".tr,
                  margin: EdgeInsets.only(left: 74.h),
                  buttonStyle: CustomButtonStyles.outlineWhiteATL20),
              SizedBox(height: 11.v)
            ]));
  }

  /// Navigates to the dtCameraScreen when the action is triggered.
  onTapRetakeButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dtCameraScreen,
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
