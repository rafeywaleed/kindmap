import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindmap/new_Auth/auth_fn.dart';
import 'package:provider/provider.dart';

import 'Model_nAuth.dart';
export 'Model_nAuth.dart';

class AuthenticationCopyWidget extends StatefulWidget {
  const AuthenticationCopyWidget({Key? key}) : super(key: key);

  @override
  State<AuthenticationCopyWidget> createState() =>
      _AuthenticationCopyWidgetState();
}

class _AuthenticationCopyWidgetState extends State<AuthenticationCopyWidget>
    with TickerProviderStateMixin {
  String s_email = '';
  String s_password = '';
  String s_fullname = '';
  // bool login = false;
  String l_email = '';
  String l_password = '';
  bool _passwordVisible = false;

  late AuthenticationCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0, 80),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1, 1),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: Offset(0, 20),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: Offset(0, 20),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    _model = createModel(context, () => AuthenticationCopyModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(32),
                child: Container(
                  width: double.infinity,
                  height: 197,
                  decoration: BoxDecoration(
                    color: Color(0xFFFAC6C3),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0,
                        color: Color(0x33000000),
                        offset: Offset(
                          4,
                          4,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/KindMap-logo-f.png',
                                    width: 144,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'KindMap',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.black,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 2, 0, 0),
                                      child: Text(
                                        'Connecting Hearts, Changing Life',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                              fontSize: 10,
                                              letterSpacing: 0,
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
                      Container(
                        width: 100,
                        height: 194,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width >= 768.0
                                ? 530.0
                                : 630.0,
                            constraints: BoxConstraints(
                              maxWidth: 570,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    4,
                                    4,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              32, 0, 32, 0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                      unselectedLabelStyle: TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      indicatorWeight: 3,
                                      tabs: [
                                        Tab(
                                          text: 'Create Account',
                                        ),
                                        Tab(
                                          text: 'Log In',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 16, 24, 0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Container(
                                                      width: 230,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                  Text(
                                                    'Create Account',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 24),
                                                    child: Text(
                                                      'Let\'s get started by filling out the form below.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                  Form(
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          key: ValueKey(
                                                              'Full Name'),
                                                          autofocus: true,
                                                          autofillHints: [
                                                            AutofillHints.email
                                                          ],
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Full Name',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    24),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                          minLines: null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return 'Please Enter Full Name';
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          onSaved: (value) {
                                                            setState(() {
                                                              s_fullname =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        TextFormField(
                                                          key:
                                                              ValueKey('email'),
                                                          autofocus: true,
                                                          autofillHints: [
                                                            AutofillHints.email
                                                          ],
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: 'Email',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    24),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                          minLines: null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          validator: (value) {
                                                            if (value!
                                                                    .isEmpty ||
                                                                !value.contains(
                                                                    '@')) {
                                                              return 'Please Enter valid Email';
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          onSaved: (value) {
                                                            setState(() {
                                                              s_email = value!;
                                                            });
                                                          },
                                                        ),
                                                        TextFormField(
                                                          key: ValueKey(
                                                              'password'),
                                                          obscureText:
                                                              !_passwordVisible,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Password',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    24),
                                                            suffixIcon:
                                                                IconButton(
                                                              icon: Icon(
                                                                // Based on passwordVisible state choose the icon
                                                                _passwordVisible
                                                                    ? Icons
                                                                        .visibility
                                                                    : Icons
                                                                        .visibility_off,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColorDark,
                                                              ),
                                                              onPressed: () {
                                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                                setState(() {
                                                                  _passwordVisible =
                                                                      !_passwordVisible;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                          minLines: null,
                                                          validator: (value) {
                                                            if (value!.length <
                                                                6) {
                                                              return 'Please Enter Password of min length 6';
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          onSaved: (value) {
                                                            setState(() {
                                                              s_password =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              AuthServices
                                                                  .signupUser(
                                                                      s_email,
                                                                      s_password,
                                                                      s_fullname,
                                                                      context);
                                                            },
                                                            child:
                                                                Text('Signup')),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation1']!),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 16, 24, 0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Container(
                                                      width: 230,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                  Text(
                                                    'Welcome Back',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 24),
                                                    child: Text(
                                                      'Fill out the information below in order to access your account.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                  Form(
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          key:
                                                              ValueKey('email'),
                                                          autofocus: true,
                                                          autofillHints: [
                                                            AutofillHints.email
                                                          ],
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: 'Email',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    24),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                          minLines: null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          validator: (value) {
                                                            if (value!
                                                                    .isEmpty ||
                                                                !value.contains(
                                                                    '@')) {
                                                              return 'Please Enter valid Email';
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          onSaved: (value) {
                                                            setState(() {
                                                              l_email = value!;
                                                            });
                                                          },
                                                        ),
                                                        TextFormField(
                                                          key: ValueKey(
                                                              'password'),
                                                          obscureText:
                                                              !_passwordVisible,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Password',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    24),
                                                            suffixIcon:
                                                                IconButton(
                                                              icon: Icon(
                                                                // Based on passwordVisible state choose the icon
                                                                _passwordVisible
                                                                    ? Icons
                                                                        .visibility
                                                                    : Icons
                                                                        .visibility_off,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColorDark,
                                                              ),
                                                              onPressed: () {
                                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                                setState(() {
                                                                  _passwordVisible =
                                                                      !_passwordVisible;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                          minLines: null,
                                                          validator: (value) {
                                                            if (value!.length <
                                                                6) {
                                                              return 'Please Enter Password of min length 6';
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          onSaved: (value) {
                                                            setState(() {
                                                              l_password =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Container(
                                                          height: 55,
                                                          width:
                                                              double.infinity,
                                                          child: ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                AuthServices
                                                                    .signinUser(
                                                                        l_email,
                                                                        l_password,
                                                                        context);
                                                                print(
                                                                    "Login hua");
                                                              },
                                                              child: Text(
                                                                  'Login')),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation2']!),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
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
}
