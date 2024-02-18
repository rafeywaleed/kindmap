import 'notifier/app_navigation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';

class AppNavigationScreen extends ConsumerStatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
}

class AppNavigationScreenState extends ConsumerState<AppNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign-up page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Change name One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltChangeNameOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-About".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltAboutScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Change name".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltChangeNameScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Dir/Dst-Preview-Post".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.ltDirDstPreviewPostScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltSettingsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Permissions".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltPermissionsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Notify".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltNotifyScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Exp-Map".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.expMapScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "area-map One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.areaMapOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Camera".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltCameraScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Submission page".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.ltSubmissionPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Light theme".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.lightThemeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Intro-Screen-One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.introScreenOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Intro-Screen-Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.introScreenTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Intro-Screen-Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.introScreenThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Intro-Screen-Four".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.introScreenFourScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dark Theme".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.darkThemeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Camera".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dtCameraScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Submission page".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.dtSubmissionPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Log-in page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.logInPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "verify-email".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.verifyEmailScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "new-password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.newPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "area-map".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.areaMapScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Exp-Map One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.expMapOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Change name".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dtChangeNameScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dark-theme-Menu".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.darkThemeMenuScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LT-Notify One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ltNotifyOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dtSettingsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dtProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Dir/Dst-Preview-Post".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.dtDirDstPreviewPostScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Permissions".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dtPermissionsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-About".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dtAboutScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DT-Change Password".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.dtChangePasswordScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
