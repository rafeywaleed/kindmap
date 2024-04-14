import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:kindmap/Auth/Authentication.dart';
import 'SettingsPage.dart' show SettingsPage;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsPage> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  // FireBase
  // Logout

  // void logout() async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.popUntil(context as BuildContext, (route) => route.isFirst);
  //   Navigator.pushReplacement(context as BuildContext,
  //       MaterialPageRoute(builder: (context) => AuthenticationPage()));
  // }
}
