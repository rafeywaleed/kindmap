import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        endDrawer: Drawer(
          elevation: 16,
          child: SingleChildScrollView(
            child: Container(
              width: 407,
              height: 933,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
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
                    opacity: 0.2,
                    child: Container(
                      width: 355,
                      height: 957,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
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
                    alignment: const AlignmentDirectional(0.11, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/deerlogo.jpg',
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(-1, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      18, 0, 0, 10),
                                  child: Text(
                                    'User name here',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 22.5,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: 0,
                          child: Container(
                            width: 100,
                            height: 173,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: const AlignmentDirectional(-1, 0),
                          ),
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
                              Navigator.of(context).pushNamed('Settings');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.settings_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              title: Text(
                                'Settings',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              dense: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 0.25,
                              children: [
                                SlidableAction(
                                  label: 'Share',
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).info,
                                  icon: Icons.share,
                                  onPressed: (_) {
                                    print('SlidableActionWidget pressed ...');
                                  },
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.contacts_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              title: Text(
                                'Contact',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            title: Text(
                              'About',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                        Opacity(
                          opacity: 0,
                          child: Container(
                            width: 100,
                            height: 137,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 87,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                                boxShadow: [
                                  const BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.black,
                                    offset: Offset(
                                      2,
                                      3,
                                    ),
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent1,
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
                                              ;
                                            },
                                            child: Icon(
                                              Icons.nights_stay,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Provider.of<ThemeProvider>(context, listen: false)
                        //         .toggleTheme();
                        //   },
                        //   child: Text('Toggle Theme'),
                        // )
                        // ElevatedButton(
                        //   onPressed: _toggleTheme,
                        //   child: Text('Toggle Theme'),
                        // ),

                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        //   child: Container(
                        //     width: 250,
                        //     height: 50,
                        //     decoration: BoxDecoration(
                        //       color: Color(0xD557636C),
                        //       borderRadius: BorderRadius.circular(12),
                        //       border: Border.all(
                        //         color: Color(0xD557636C),
                        //         width: 1,
                        //       ),
                        //     ),
                        //     child: Padding(
                        //       padding: EdgeInsets.all(4),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Expanded(
                        //             child: InkWell(
                        //               splashColor: Colors.transparent,
                        //               focusColor: Colors.transparent,
                        //               hoverColor: Colors.transparent,
                        //               highlightColor: Colors.transparent,
                        //               onTap: () {},
                        //               // onTap: () async {
                        //               //   setDarkModeSetting(
                        //               //       context, ThemeMode.light);
                        //               // },
                        //               // ***********HAD TO BE SET AFTER CREATING THEME COLORS FILE******
                        //               child: Container(
                        //                 width: 115,
                        //                 height: 100,
                        //                 decoration: BoxDecoration(
                        //                   color: Theme.of(context).brightness ==
                        //                           Brightness.light
                        //                       ? Colors.white
                        //                       : Color(0xD557636C),
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   border: Border.all(
                        //                     color: Color(0xD557636C),
                        //                     width: 1,
                        //                   ),
                        //                 ),
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.max,
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: [
                        //                     Icon(
                        //                       Icons.wb_sunny_rounded,
                        //                       color:
                        //                           Theme.of(context).brightness ==
                        //                                   Brightness.light
                        //                               ? Color(0xFF14181B)
                        //                               : Color(0xFF57636C),
                        //                       size: 16,
                        //                     ),
                        //                     Padding(
                        //                       padding:
                        //                           EdgeInsetsDirectional.fromSTEB(
                        //                               4, 0, 0, 0),
                        //                       child: Text(
                        //                         'Light Mode',
                        //                         style:
                        //                             FlutterFlowTheme.of(context)
                        //                                 .bodyMedium
                        //                                 .override(
                        //                                   fontFamily: 'Outfit',
                        //                                   color: Theme.of(context)
                        //                                               .brightness ==
                        //                                           Brightness.light
                        //                                       ? Color(0xFF14181B)
                        //                                       : Color(0xFF57636C),
                        //                                   fontSize: 14,
                        //                                   letterSpacing: 0,
                        //                                   fontWeight:
                        //                                       FontWeight.w500,
                        //                                 ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           Expanded(
                        //             child: InkWell(
                        //               splashColor: Colors.transparent,
                        //               focusColor: Colors.transparent,
                        //               hoverColor: Colors.transparent,
                        //               highlightColor: Colors.transparent,
                        //               onTap: () {},
                        //               // onTap: () async {
                        //               //   setDarkModeSetting(
                        //               //       context, ThemeMode.dark);
                        //               // },
                        //               // ***********HAD TO BE SET AFTER CREATING THEME COLORS FILE******
                        //               child: Container(
                        //                 width: 115,
                        //                 height: 100,
                        //                 decoration: BoxDecoration(
                        //                   color: Theme.of(context).brightness ==
                        //                           Brightness.dark
                        //                       ? Colors.white
                        //                       : Color(0xD557636C),
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   border: Border.all(
                        //                     color: Color(0xD557636C),
                        //                     width: 1,
                        //                   ),
                        //                 ),
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.max,
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: [
                        //                     Icon(
                        //                       Icons.nightlight_round,
                        //                       color:
                        //                           Theme.of(context).brightness ==
                        //                                   Brightness.dark
                        //                               ? Color(0xFF14181B)
                        //                               : Color(0xFF57636C),
                        //                       size: 16,
                        //                     ),
                        //                     Padding(
                        //                       padding:
                        //                           EdgeInsetsDirectional.fromSTEB(
                        //                               4, 0, 0, 0),
                        //                       child: Text(
                        //                         'Dark Mode',
                        //                         style:
                        //                             FlutterFlowTheme.of(context)
                        //                                 .bodyMedium
                        //                                 .override(
                        //                                   fontFamily: 'Outfit',
                        //                                   color: Theme.of(context)
                        //                                               .brightness ==
                        //                                           Brightness.dark
                        //                                       ? Color(0xFF14181B)
                        //                                       : Color(0xFF57636C),
                        //                                   fontSize: 14,
                        //                                   letterSpacing: 0,
                        //                                   fontWeight:
                        //                                       FontWeight.w500,
                        //                                 ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/KindMap-logo-f.png',
              width: 500,
              height: 500,
              fit: BoxFit.cover,
            ),
          ),
          title: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Text(
              'KindMap',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
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
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).error,
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
                              Navigator.of(context).pushNamed('Camera');
                            },
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Text(
                                        'Spot people nearby',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 22,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 9),
                                      child: Icon(
                                        Icons.share_location,
                                        color: FlutterFlowTheme.of(context)
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
                                      //     color: FlutterFlowTheme.of(context)
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
                      width: 425,
                      height: 285,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0, -1.3),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Container(
                                        width: 376,
                                        height: 79,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: const Text(
                                                        'spot an area')));
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -0.93, -0.81),
                                                child: Text(
                                                  'Spot an area',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 25,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -0.15, -0.55),
                                                child: Text(
                                                  'Spot an area where large number of people are seeking\nhelp. (NGOs and Organization may look forward to help them)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0, -0.38),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Container(
                                        width: 376,
                                        height: 88,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.of(context)
                                                .pushNamed('NotifyMe');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -0.93, -0.81),
                                                child: Text(
                                                  'Notify Me',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 25,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -0.15, -0.55),
                                                child: Text(
                                                  'Spot an area where large number of people are seeking\nhelp. (NGOs and Organization may look forward to help them)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(
                                        -0.93, -0.81),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Container(
                                        width: 376,
                                        height: 88,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.of(context)
                                                .pushNamed('Donate');
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -1.0, 0.0),
                                                child: Text(
                                                  'Donate',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 25,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -0.15, -0.55),
                                                child: Text(
                                                  'You can also donate',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
    );
  }
}
