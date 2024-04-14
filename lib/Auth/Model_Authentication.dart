// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:kindmap/Homepage/HomePage.dart';
import 'package:kindmap/IntroScreens/IntroScreens.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timeago/timeago.dart';
import 'Authentication.dart' show AuthenticationPage;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthenticationModel extends FlutterFlowModel<AuthenticationPage> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;

  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;

  FocusNode? passwordFocusNode1;
  TextEditingController? passwordController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordController1Validator;

// Sign up === 1 (above)
// Signing in ==== 2 (below)

  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;

  FocusNode? passwordFocusNode2;
  TextEditingController? passwordController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordController2Validator;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    emailAddressFocusNode1?.dispose();
    emailAddressController1?.dispose();

    passwordFocusNode1?.dispose();
    passwordController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressController2?.dispose();

    passwordFocusNode2?.dispose();
    passwordController2?.dispose();
  }

  // /// FireBase part

  // // Signing up
  // void createAccount() async {
  //   String sFullName = fullNameController.text.trim();
  //   String sEmail = emailAddressController1.text.trim();
  //   String sPassword = passwordController1.text.trim();

  //   if (sEmail == "" || sPassword == "" || sFullName == "") {
  //     log("Fill all the details");
  //   } else {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: sEmail, password: sPassword);

  //       if (userCredential.user != null) {
  //         Navigator.push(
  //           context as BuildContext,
  //           MaterialPageRoute(builder: (context) => IntroScreens()),
  //         );
  //       }
  //     } on FirebaseAuthException catch (ex) {
  //       log(ex.code.toString());
  //     }
  //   }
  // }

  // // Log in

  // void login() async {
  //   String lEmail = emailAddressController2.text.trim();
  //   String lPassword = passwordController2.text.trim();

  //   if (lEmail == "" || lPassword == "") {
  //     log("Fill all the details");
  //   } else {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: lEmail, password: lPassword);

  //       if (userCredential != null) {
  //         Navigator.popUntil(context as BuildContext, (route) => route.isFirst);
  //         Navigator.pushReplacement(
  //           context as BuildContext,
  //           MaterialPageRoute(builder: (context) => HomePage()),
  //         );
  //       }
  //     } on FirebaseAuthException catch (ex) {
  //       log(ex.code.toString());
  //     }
  //   }
  // }
}
