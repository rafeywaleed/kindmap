import 'package:flutter/material.dart';
import 'package:kindmap/presentation/sign_up_page_screen/sign_up_page_screen.dart';
import 'package:kindmap/presentation/lt_change_name_one_screen/lt_change_name_one_screen.dart';
import 'package:kindmap/presentation/lt_about_screen/lt_about_screen.dart';
import 'package:kindmap/presentation/lt_change_name_screen/lt_change_name_screen.dart';
import 'package:kindmap/presentation/lt_dir_dst_preview_post_screen/lt_dir_dst_preview_post_screen.dart';
import 'package:kindmap/presentation/lt_settings_screen/lt_settings_screen.dart';
import 'package:kindmap/presentation/lt_profile_screen/lt_profile_screen.dart';
import 'package:kindmap/presentation/lt_permissions_screen/lt_permissions_screen.dart';
import 'package:kindmap/presentation/lt_notify_screen/lt_notify_screen.dart';
import 'package:kindmap/presentation/exp_map_screen/exp_map_screen.dart';
import 'package:kindmap/presentation/area_map_one_screen/area_map_one_screen.dart';
import 'package:kindmap/presentation/lt_camera_screen/lt_camera_screen.dart';
import 'package:kindmap/presentation/lt_submission_page_screen/lt_submission_page_screen.dart';
import 'package:kindmap/presentation/light_theme_screen/light_theme_screen.dart';
import 'package:kindmap/presentation/intro_screen_one_screen/intro_screen_one_screen.dart';
import 'package:kindmap/presentation/intro_screen_two_screen/intro_screen_two_screen.dart';
import 'package:kindmap/presentation/intro_screen_three_screen/intro_screen_three_screen.dart';
import 'package:kindmap/presentation/intro_screen_four_screen/intro_screen_four_screen.dart';
import 'package:kindmap/presentation/dark_theme_screen/dark_theme_screen.dart';
import 'package:kindmap/presentation/dt_camera_screen/dt_camera_screen.dart';
import 'package:kindmap/presentation/dt_submission_page_screen/dt_submission_page_screen.dart';
import 'package:kindmap/presentation/log_in_page_screen/log_in_page_screen.dart';
import 'package:kindmap/presentation/verify_email_screen/verify_email_screen.dart';
import 'package:kindmap/presentation/new_password_screen/new_password_screen.dart';
import 'package:kindmap/presentation/area_map_screen/area_map_screen.dart';
import 'package:kindmap/presentation/exp_map_one_screen/exp_map_one_screen.dart';
import 'package:kindmap/presentation/dt_change_name_screen/dt_change_name_screen.dart';
import 'package:kindmap/presentation/dark_theme_menu_screen/dark_theme_menu_screen.dart';
import 'package:kindmap/presentation/lt_notify_one_screen/lt_notify_one_screen.dart';
import 'package:kindmap/presentation/dt_settings_screen/dt_settings_screen.dart';
import 'package:kindmap/presentation/dt_profile_screen/dt_profile_screen.dart';
import 'package:kindmap/presentation/dt_dir_dst_preview_post_screen/dt_dir_dst_preview_post_screen.dart';
import 'package:kindmap/presentation/dt_permissions_screen/dt_permissions_screen.dart';
import 'package:kindmap/presentation/dt_about_screen/dt_about_screen.dart';
import 'package:kindmap/presentation/dt_change_password_screen/dt_change_password_screen.dart';
import 'package:kindmap/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String signUpPageScreen = '/sign_up_page_screen';

  static const String ltChangeNameOneScreen = '/lt_change_name_one_screen';

  static const String ltAboutScreen = '/lt_about_screen';

  static const String ltChangeNameScreen = '/lt_change_name_screen';

  static const String ltDirDstPreviewPostScreen =
      '/lt_dir_dst_preview_post_screen';

  static const String ltSettingsScreen = '/lt_settings_screen';

  static const String ltProfileScreen = '/lt_profile_screen';

  static const String ltPermissionsScreen = '/lt_permissions_screen';

  static const String ltNotifyScreen = '/lt_notify_screen';

  static const String expMapScreen = '/exp_map_screen';

  static const String areaMapOneScreen = '/area_map_one_screen';

  static const String ltCameraScreen = '/lt_camera_screen';

  static const String ltSubmissionPageScreen = '/lt_submission_page_screen';

  static const String lightThemeScreen = '/light_theme_screen';

  static const String introScreenOneScreen = '/intro_screen_one_screen';

  static const String introScreenTwoScreen = '/intro_screen_two_screen';

  static const String introScreenThreeScreen = '/intro_screen_three_screen';

  static const String introScreenFourScreen = '/intro_screen_four_screen';

  static const String darkThemeScreen = '/dark_theme_screen';

  static const String dtCameraScreen = '/dt_camera_screen';

  static const String dtSubmissionPageScreen = '/dt_submission_page_screen';

  static const String logInPageScreen = '/log_in_page_screen';

  static const String verifyEmailScreen = '/verify_email_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String areaMapScreen = '/area_map_screen';

  static const String expMapOneScreen = '/exp_map_one_screen';

  static const String dtChangeNameScreen = '/dt_change_name_screen';

  static const String darkThemeMenuScreen = '/dark_theme_menu_screen';

  static const String ltNotifyOneScreen = '/lt_notify_one_screen';

  static const String dtSettingsScreen = '/dt_settings_screen';

  static const String dtProfileScreen = '/dt_profile_screen';

  static const String dtDirDstPreviewPostScreen =
      '/dt_dir_dst_preview_post_screen';

  static const String dtPermissionsScreen = '/dt_permissions_screen';

  static const String dtAboutScreen = '/dt_about_screen';

  static const String dtChangePasswordScreen = '/dt_change_password_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    signUpPageScreen: (context) => SignUpPageScreen(),
    ltChangeNameOneScreen: (context) => LtChangeNameOneScreen(),
    ltAboutScreen: (context) => LtAboutScreen(),
    ltChangeNameScreen: (context) => LtChangeNameScreen(),
    ltDirDstPreviewPostScreen: (context) => LtDirDstPreviewPostScreen(),
    ltSettingsScreen: (context) => LtSettingsScreen(),
    ltProfileScreen: (context) => LtProfileScreen(),
    ltPermissionsScreen: (context) => LtPermissionsScreen(),
    ltNotifyScreen: (context) => LtNotifyScreen(),
    expMapScreen: (context) => ExpMapScreen(),
    areaMapOneScreen: (context) => AreaMapOneScreen(),
    ltCameraScreen: (context) => LtCameraScreen(),
    ltSubmissionPageScreen: (context) => LtSubmissionPageScreen(),
    lightThemeScreen: (context) => LightThemeScreen(),
    introScreenOneScreen: (context) => IntroScreenOneScreen(),
    introScreenTwoScreen: (context) => IntroScreenTwoScreen(),
    introScreenThreeScreen: (context) => IntroScreenThreeScreen(),
    introScreenFourScreen: (context) => IntroScreenFourScreen(),
    darkThemeScreen: (context) => DarkThemeScreen(),
    dtCameraScreen: (context) => DtCameraScreen(),
    dtSubmissionPageScreen: (context) => DtSubmissionPageScreen(),
    logInPageScreen: (context) => LogInPageScreen(),
    verifyEmailScreen: (context) => VerifyEmailScreen(),
    newPasswordScreen: (context) => NewPasswordScreen(),
    areaMapScreen: (context) => AreaMapScreen(),
    expMapOneScreen: (context) => ExpMapOneScreen(),
    dtChangeNameScreen: (context) => DtChangeNameScreen(),
    darkThemeMenuScreen: (context) => DarkThemeMenuScreen(),
    ltNotifyOneScreen: (context) => LtNotifyOneScreen(),
    dtSettingsScreen: (context) => DtSettingsScreen(),
    dtProfileScreen: (context) => DtProfileScreen(),
    dtDirDstPreviewPostScreen: (context) => DtDirDstPreviewPostScreen(),
    dtPermissionsScreen: (context) => DtPermissionsScreen(),
    dtAboutScreen: (context) => DtAboutScreen(),
    dtChangePasswordScreen: (context) => DtChangePasswordScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => SignUpPageScreen(),
  };
}
