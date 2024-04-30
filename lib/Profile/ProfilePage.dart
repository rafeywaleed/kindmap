import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/Profile/Model_ProfilePage.dart';
import 'package:kindmap/themes/kmTheme.dart';

export 'Model_ProfilePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
        backgroundColor: KMTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: KMTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 40,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: KMTheme.of(context).primaryText,
              size: 24,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Profile',
            style: KMTheme.of(context).bodyMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 22,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
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
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 8, 8, 4),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .snapshots(),
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData) {
                                    return FittedBox(
                                      child: Text(
                                        snapshot.data!['name'],
                                        style: KMTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    );
                                  }
                                  return const Center(
                                      child: LinearProgressIndicator());
                                })),
                            // Text(
                            //   'Username Goes here',
                            //   style: KMTheme.of(context)
                            //       .bodyMedium
                            //       .override(
                            //         fontFamily: 'Readex Pro',
                            //         fontSize: 20,
                            //         letterSpacing: 0,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            // ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .snapshots(),
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Center(
                                      child: Text(
                                        snapshot.data!['email'],
                                        style: KMTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    );
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                })),
                            // Text(
                            //   'Mail Id goes here',
                            //   style: KMTheme.of(context)
                            //       .bodyMedium
                            //       .override(
                            //         fontFamily: 'Readex Pro',
                            //         letterSpacing: 0,
                            //       ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: 100,
                //   height: 28,
                //   decoration: BoxDecoration(
                //     color: KMTheme.of(context).secondaryBackground,
                //   ),
                // ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  // child: Container(
                  //   width: 378,
                  //   height: 122,
                  //   decoration: BoxDecoration(
                  //     color: KMTheme.of(context).secondaryBackground,
                  //   ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/trophy.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Text(
                              'Number of people you helped :',
                              style: KMTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .snapshots(),
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data!['helped'].toString(),
                                      style: KMTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 35,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    );
                                  }
                                  return const Center(
                                      child: LinearProgressIndicator());
                                })),
                          ),
                          // Text(
                          //   '5 ',
                          //   style: KMTheme.of(context)
                          //       .bodyMedium
                          //       .override(
                          //         fontFamily: 'Readex Pro',
                          //         fontSize: 35,
                          //         letterSpacing: 0,
                          //         fontWeight: FontWeight.w800,
                          //       ),
                          // ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'These many people are thankful \nfor you',
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: KMTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: KMTheme.of(context).secondaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Container(
                    width: 428,
                    height: 100,
                    decoration: BoxDecoration(
                      color: KMTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Change name : ',
                              style: KMTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  KMTheme.of(context).labelMedium.override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                      ),
                              hintText: 'New Name',
                              hintStyle:
                                  KMTheme.of(context).labelMedium.override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                      ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: KMTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: KMTheme.of(context).primary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: KMTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: KMTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: KMTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                            minLines: null,
                            validator: _model.textController1Validator
                                .asValidator(context),
                            onFieldSubmitted: (newValue) {
                              _model.textController1!.clear();
                              if (newValue == '') return;
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .update({'name': newValue});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: 403,
                      height: 266,
                      decoration: BoxDecoration(
                        color: KMTheme.of(context).accent4,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: KMTheme.of(context).primaryText,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 6, 6, 0),
                              child: Text(
                                'Change Password :',
                                style: KMTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                labelStyle:
                                    KMTheme.of(context).labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                hintStyle:
                                    KMTheme.of(context).labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).tertiary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              style: KMTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                              minLines: null,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _model.textController3,
                              focusNode: _model.textFieldFocusNode3,
                              autofocus: true,
                              obscureText: !_model.passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle:
                                    KMTheme.of(context).labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                hintStyle:
                                    KMTheme.of(context).labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).tertiary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: KMTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordVisibility =
                                        !_model.passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20,
                                  ),
                                ),
                              ),
                              style: KMTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                              minLines: null,
                              validator: _model.textController3Validator
                                  .asValidator(context),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Change Password',
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24, 0, 24, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: KMTheme.of(context).primary,
                              textStyle:
                                  KMTheme.of(context).titleSmall.override(
                                        fontFamily: 'Readex Pro',
                                        color: KMTheme.of(context).secondary,
                                        letterSpacing: 0,
                                      ),
                              elevation: 3,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser?.uid)
                            .snapshots(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return AutoSizeText(
                              'Joined KindMap on ${snapshot.data!['joined']}',
                              style: KMTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    color: const Color(0xB457636C),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              minFontSize: 10,
                            );
                          }
                          return const Center(child: LinearProgressIndicator());
                        })),
                    // AutoSizeText(
                    //   'Joined KindMap on 00/00/0000',
                    //   style: KMTheme.of(context).bodyMedium.override(
                    //         fontFamily: 'Open Sans',
                    //         color: const Color(0xB457636C),
                    //         letterSpacing: 0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //   minFontSize: 10,
                    // ),
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
