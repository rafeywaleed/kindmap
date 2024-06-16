// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kindmap/components/BoxHandle.dart';
import 'package:kindmap/components/FollowBox.dart';
import 'package:kindmap/components/SocialTile.dart';
import 'package:kindmap/themes/kmTheme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindmap/new_Auth/user.dart';
import 'package:provider/provider.dart';

import 'Model_Settings.dart';
export 'Model_Settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  String? selectedTeamMember;
  String? selectedMedia;
  void updateSelectedMedia(String media) {
    setState(() {
      selectedMedia = media;
    });
  }

  void showFollowBox(String media) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //backgroundColor: Colors.transparent,
      builder: (context) => FollowBox(s_media: media),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: KMTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: KMTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: KMTheme.of(context).primaryText,
            size: 25,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: Text(
              'Settings Page',
              style: KMTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: KMTheme.of(context).titleLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: KMTheme.of(context).secondaryText,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.of(context).pushNamed('/notifications');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications',
                            style: KMTheme.of(context).titleLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: KMTheme.of(context).secondaryText,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.of(context).pushNamed('/help');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Help',
                            style: KMTheme.of(context).titleLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: KMTheme.of(context).secondaryText,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.of(context).pushNamed('/privacypolicy');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Privacy Policy',
                            style: KMTheme.of(context).titleLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: KMTheme.of(context).secondaryText,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.of(context).pushNamed('/permissions');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Permissions ',
                            style: KMTheme.of(context).titleLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: KMTheme.of(context).secondaryText,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 8),
            child: Text(
              'Follow us on',
              style: KMTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SocialMediaIconButton(
                  borderColor: KMTheme.of(context).alternate,
                  borderRadius: 12,
                  borderWidth: 1,
                  buttonSize: 48,
                  fillColor: KMTheme.of(context).secondaryBackground,
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: KMTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  onPressed: () {
                    showFollowBox("instagram");
                  },
                ),
                SocialMediaIconButton(
                  borderColor: KMTheme.of(context).alternate,
                  borderRadius: 12,
                  borderWidth: 1,
                  buttonSize: 48,
                  fillColor: KMTheme.of(context).secondaryBackground,
                  icon: FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: KMTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  onPressed: () {
                    showFollowBox("facebook");
                  },
                ),
                SocialMediaIconButton(
                  borderColor: KMTheme.of(context).alternate,
                  borderRadius: 12,
                  borderWidth: 1,
                  buttonSize: 48,
                  fillColor: KMTheme.of(context).secondaryBackground,
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: KMTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  onPressed: () {
                    showFollowBox("linkedin");
                  },
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: PopupMenuButton<String>(
                //     icon: FaIcon(
                //       FontAwesomeIcons.linkedin,
                //       color: KMTheme.of(context).secondaryText,
                //       size: 24,
                //     ),
                //     itemBuilder: (BuildContext context) => [
                //       const PopupMenuItem(
                //         value:
                //             'https://www.linkedin.com/in/abdul-rafey-waleed-516052282/',
                //         child: ListTile(
                //           leading: Icon(FontAwesomeIcons.linkedin),
                //           title: Text('Abdul Rafey Waleed'),
                //         ),
                //       ),
                //       const PopupMenuItem(
                //         value:
                //             'https://www.linkedin.com/in/mohammed-azim-moula-7b07b4279/',
                //         child: ListTile(
                //           leading: Icon(FontAwesomeIcons.linkedin),
                //           title: Text('Mohammed Azim Moula'),
                //         ),
                //       ),
                //       const PopupMenuItem(
                //         value:
                //             'https://www.linkedin.com/in/syeda-arriyan-fatima-a71346301/',
                //         child: ListTile(
                //           leading: Icon(FontAwesomeIcons.linkedin),
                //           title: Text('Arriyan Fatima'),
                //         ),
                //       ),
                //     ],
                //     onSelected: (String value) {
                //       launch(value);
                //     },
                //   ),
                // ),
              ].divide(const SizedBox(width: 8)),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: Text(
              'App Versions',
              style: KMTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
            child: Text(
              'v0.0.1',
              style: KMTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
            child: FFButtonWidget(
              onPressed: () {
                logout();
              },
              text: 'Log Out',
              options: FFButtonOptions(
                height: 40,
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: KMTheme.of(context).error,
                textStyle: KMTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: KMTheme.of(context).info,
                      letterSpacing: 0,
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: KMTheme.of(context).error,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ].addToEnd(const SizedBox(height: 64)),
      ),
    );
  }

  // FireBase
  // Logout

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginForm()));
  }
}
