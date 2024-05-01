import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindmap/main.dart';
import 'package:kindmap/themes/kmTheme.dart';
import 'package:provider/provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'Model_HomePage.dart';
export 'Model_HomePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late HomePageModel _model;

  Future<void> sendNotification(String topic) async {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final serverKey =
        'AAAAXfsHsVE:APA91bGiEJp1y1T2h9VEHr0y-u0LoGIty04jFaHea0xtvwsUXOutSi2F5lRkwhEQmHV4MmQs2kEtoHhkxX1LDAeSGeHuk5ZzYZ5Gkec2oTUmqaktuf3Gv3Q4KuMsjpG2M6w76VHaxxbh'; // Replace with your FCM server key
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };
    final body = {
      'notification': {
        'title': 'KindMap',
        'body': 'Someone nearby needs help.',
      },
      'priority': 'high',
      'to': '/topics/$topic', // Specify the topic here
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      print('Notification sent successfully to topic: $topic');
    } else {
      print(
          'Failed to send notification to topic: $topic. Error: ${response.reasonPhrase}');
    }
  }

  // ThemeData _currentTheme = LightModeTheme() as ThemeData;

  // void _toggleTheme() {
  //   setState(() {
  //     _currentTheme = (_currentTheme == LightModeTheme()
  //         ? DarkModeTheme()
  //         : LightModeTheme()) as ThemeData;
  //   });
  // }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'endDrawerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: KMTheme.of(context).alternate,
        endDrawer: Drawer(
          elevation: 16,
          child: SizedBox(
            child: Container(
              // width: 407,
              // height: 933,
              decoration: BoxDecoration(
                color: KMTheme.of(context).tertiary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: Theme.of(context).brightness == Brightness.light
                        ? 0.2
                        : 0.7,
                    child: Container(
                      // width: 355,
                      // height: 957,
                      width: size.width * 1.3,
                      height: size.height * 1.3,
                      decoration: BoxDecoration(
                        color: KMTheme.of(context).tertiary,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/img_menubar.png',
                          ).image,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    // alignment: const AlignmentDirectional(0.11, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: KMTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  4,
                                  4,
                                ),
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Container(
                                      width: size.width * 0.3,
                                      height: size.width * 0.3,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/deerlogo.jpg',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 10),
                                  child: StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(FirebaseAuth
                                              .instance.currentUser?.uid)
                                          .snapshots(),
                                      builder: ((context, snapshot) {
                                        if (snapshot.hasData) {
                                          return FittedBox(
                                            child: Text(
                                              snapshot.data!['name'],
                                              style: KMTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontSize: 22.5,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          );
                                        }
                                        return const Center(
                                            child: LinearProgressIndicator());
                                      })),
                                  // Text(
                                  //   'User name here',
                                  //   style: KMTheme.of(context)
                                  //       .bodyMedium
                                  //       .override(
                                  //         fontFamily: 'Plus Jakarta Sans',
                                  //         fontSize: 22.5,
                                  //         letterSpacing: 0,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Opacity(
                        //   opacity: 0,
                        //   child: Container(
                        //     height: 70 % size.height,
                        //     decoration: BoxDecoration(
                        //       color: KMTheme.of(context).secondaryBackground,
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     alignment: const AlignmentDirectional(-1, 0),
                        //   ),
                        // ),
                        SizedBox(
                          height: size.height * 0.2,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.of(context).pushNamed('/settings');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.settings_sharp,
                                color: KMTheme.of(context).primaryText,
                              ),
                              title: Text(
                                'Settings',
                                textAlign: TextAlign.start,
                                style: KMTheme.of(context).titleLarge.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              tileColor:
                                  KMTheme.of(context).secondaryBackground,
                              dense: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: ListTile(
                            leading: Icon(
                              Icons.info,
                              color: KMTheme.of(context).primaryText,
                            ),
                            title: Text(
                              'Contact',
                              textAlign: TextAlign.start,
                              style: KMTheme.of(context).titleLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            tileColor: KMTheme.of(context).secondaryBackground,
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              //extentRatio: 0.25,
                              children: [
                                SlidableAction(
                                  label: 'Share',
                                  backgroundColor: KMTheme.of(context).info,
                                  icon: Icons.share,
                                  onPressed: (_) {
                                    print('SlidableActionWidget pressed ...');
                                  },
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.share,
                                color: KMTheme.of(context).primaryText,
                              ),
                              title: Text(
                                'Share',
                                textAlign: TextAlign.start,
                                style: KMTheme.of(context).titleLarge.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              tileColor:
                                  KMTheme.of(context).secondaryBackground,
                              dense: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: ListTile(
                            leading: Icon(
                              Icons.info,
                              color: KMTheme.of(context).primaryText,
                            ),
                            title: Text(
                              'About',
                              textAlign: TextAlign.start,
                              style: KMTheme.of(context).titleLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            tileColor: KMTheme.of(context).secondaryBackground,
                            dense: false,
                          ),
                        ),
                        Opacity(
                          opacity: 0,
                          child: Container(
                            height: 50 % size.height,
                            decoration: BoxDecoration(
                              color: KMTheme.of(context).secondaryBackground,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 0.2 * size.width,
                              height: 0.1 * size.width,
                              decoration: BoxDecoration(
                                color: KMTheme.of(context).lineColor,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.black,
                                    offset: Offset(2, 3),
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: KMTheme.of(context).accent1,
                                  width: 4,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Stack(
                                  alignment: const AlignmentDirectional(0, 0),
                                  children: [
                                    if (Theme.of(context).brightness ==
                                        Brightness.light)
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -0.74, -0.2),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 6, 0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .toggleTheme();
                                            },
                                            child: Icon(
                                              Icons.nights_stay,
                                              color: KMTheme.of(context)
                                                  .primaryText,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (Theme.of(context).brightness ==
                                        Brightness.dark)
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.70, 0.25),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5, 0, 0, 0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .toggleTheme();
                                            },
                                            child: Icon(
                                              Icons.wb_sunny_rounded,
                                              color: KMTheme.of(context)
                                                  .primaryText,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Align(
                        //   alignment: const AlignmentDirectional(-1, 0),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8),
                        //     child: Container(
                        //       width: 80 % size.width,
                        //       // height: 50,
                        //       decoration: BoxDecoration(
                        //         color: KMTheme.of(context).lineColor,
                        //         boxShadow: [
                        //           const BoxShadow(
                        //             blurRadius: 8,
                        //             color: Colors.black,
                        //             offset: Offset(
                        //               2,
                        //               3,
                        //             ),
                        //             spreadRadius: 1,
                        //           )
                        //         ],
                        //         borderRadius: BorderRadius.circular(24),
                        //         border: Border.all(
                        //           color: KMTheme.of(context).accent1,
                        //           width: 4,
                        //         ),
                        //       ),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(2),
                        //         child: Stack(
                        //           alignment: const AlignmentDirectional(0, 0),
                        //           children: [
                        //             if (Theme.of(context).brightness ==
                        //                 Brightness.light)
                        //               Align(
                        //                 alignment: const AlignmentDirectional(
                        //                     -0.74, -0.2),
                        //                 child: Padding(
                        //                   padding: const EdgeInsetsDirectional
                        //                       .fromSTEB(0, 0, 6, 0),
                        //                   child: InkWell(
                        //                     splashColor: Colors.transparent,
                        //                     focusColor: Colors.transparent,
                        //                     hoverColor: Colors.transparent,
                        //                     highlightColor: Colors.transparent,
                        //                     onTap: () async {
                        //                       Provider.of<ThemeProvider>(
                        //                               context,
                        //                               listen: false)
                        //                           .toggleTheme();
                        //                       ;
                        //                     },
                        //                     child: Icon(
                        //                       Icons.nights_stay,
                        //                       color:
                        //                           KMTheme.of(context)
                        //                               .primaryText,
                        //                       size: 30,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //             if (Theme.of(context).brightness ==
                        //                 Brightness.dark)
                        //               Align(
                        //                 alignment: const AlignmentDirectional(
                        //                     0.70, 0.25),
                        //                 child: Padding(
                        //                   padding: const EdgeInsetsDirectional
                        //                       .fromSTEB(5, 0, 0, 0),
                        //                   child: InkWell(
                        //                     splashColor: Colors.transparent,
                        //                     focusColor: Colors.transparent,
                        //                     hoverColor: Colors.transparent,
                        //                     highlightColor: Colors.transparent,
                        //                     onTap: () async {
                        //                       Provider.of<ThemeProvider>(
                        //                               context,
                        //                               listen: false)
                        //                           .toggleTheme();
                        //                     },
                        //                     child: Icon(
                        //                       Icons.wb_sunny_rounded,
                        //                       color:
                        //                           KMTheme.of(context)
                        //                               .primaryText,
                        //                       size: 30,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).animateOnActionTrigger(
          animationsMap['endDrawerOnActionTriggerAnimation']!,
        ),
        appBar: AppBar(
          backgroundColor: KMTheme.of(context).secondaryBackground,
          iconTheme: IconThemeData(color: KMTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/KindMap-logo-f.png',
                // width: 500,
                // height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Text(
              'KindMap',
              textAlign: TextAlign.start,
              style: KMTheme.of(context).titleMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: KMTheme.of(context).primaryText,
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 5,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              blurRadius: 0,
                              color: Color(0x33000000),
                              offset: Offset(
                                4,
                                4,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: KMTheme.of(context).secondaryText,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/map'),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/map.png',
                              width: 311,
                              height: 228,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: KMTheme.of(context).error,
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    4,
                                    4,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pushNamed('/camera');
                              },
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          'Pin Someone',
                                          style: KMTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: KMTheme.of(context)
                                                    .primaryBackground,
                                                fontSize: 22,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 6, 9),
                                        child: Icon(
                                          Icons.share_location,
                                          color: KMTheme.of(context)
                                              .primaryBackground,
                                          size: 60,
                                        ),
                                        // child: FlutterFlowIconButton(
                                        //   borderColor: Color(0x004B39EF),
                                        //   borderRadius: 20,
                                        //   borderWidth: 1,
                                        //   buttonSize: 60,
                                        //   fillColor: Color(0x0057636C),
                                        //   icon: Icon(
                                        //     Icons.share_location,
                                        //     color: KMTheme.of(context)
                                        //         .primaryBackground,
                                        //     size: 50,
                                        //   ),
                                        //   onPressed: () async {
                                        //     Navigator.of(context).pushNamed('Pin');
                                        //   },
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        // width: 425,
                        // height: 285,
                        decoration: BoxDecoration(
                          color: KMTheme.of(context).secondaryBackground,
                          boxShadow: [
                            const BoxShadow(
                              blurRadius: 0,
                              color: Color(0x33000000),
                              offset: Offset(
                                4,
                                4,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  // mainAxisSize: MainAxisSize.max,

                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: KMTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'spot an area')));
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Text(
                                                      'Spot an area',
                                                      style: KMTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: KMTheme.of(
                                                                    context)
                                                                .primaryText,
                                                            fontSize: 25,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(
                                                      'Spot an area where large number of people are seeking help. (NGOs and Organization may look forward to help them)',
                                                      style: KMTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: const Color(
                                                                0xFF404647),
                                                            fontSize: 11,
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: KMTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await sendNotification(
                                                  'need_help');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content:
                                                          Text('Notify Me')));

                                              // Navigator.of(context)
                                              //     .pushNamed('/notifyMe');
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Text(
                                                      'Notify Me',
                                                      style: KMTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: KMTheme.of(
                                                                    context)
                                                                .primaryText,
                                                            fontSize: 25,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(
                                                      'A Notification pops up whenever a pin is pointed within a 1 km radius of you',
                                                      style: KMTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: const Color(
                                                                0xFF404647),
                                                            fontSize: 12,
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: KMTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await FirebaseMessaging.instance
                                                  .requestPermission();
                                              String? token =
                                                  await FirebaseMessaging
                                                      .instance
                                                      .getToken();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(token!)));
                                              print(token);
                                              // Navigator.of(context)
                                              //     .pushNamed('/donate');
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Text(
                                                      'Donate',
                                                      style: KMTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: KMTheme.of(
                                                                    context)
                                                                .primaryText,
                                                            fontSize: 25,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  // alignment:
                                                  //     const AlignmentDirectional(
                                                  //         -0.15, -0.55),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(
                                                      'You can also donate',
                                                      style: KMTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: const Color(
                                                                0xFF404647),
                                                            fontSize: 12,
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
