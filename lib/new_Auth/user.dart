import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kindmap/new_Auth/auth_fn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).alternate,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                width: double.infinity,
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
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  shape: BoxShape.rectangle,
                ),
                alignment: AlignmentDirectional(-0.5, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/KindMap-logo-f.png',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
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
                                alignment: Alignment.centerRight,
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
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  padding: EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ======== Full Name ========
                      login
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: TextFormField(
                                key: ValueKey('Full Name'),
                                // autofillHints: [AutofillHints.email],
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding: EdgeInsets.all(20),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0,
                                    ),
                                minLines: null,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Full Name';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  setState(() {
                                    fullname = value!;
                                  });
                                },
                              ),
                            ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: TextFormField(
                          key: ValueKey('email'),
                          autofillHints: [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsets.all(20),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0,
                              ),
                          minLines: null,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please Enter valid Email';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: TextFormField(
                          key: ValueKey('password'),
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0,
                              ),
                          minLines: null,
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Please Enter Password of min length 6';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: size.height * 0.07,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              login
                                  ? AuthServices.signinUser(
                                      email, password, context)
                                  : AuthServices.signupUser(
                                      email, password, fullname, context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: FlutterFlowTheme.of(context).primary,
                            padding: EdgeInsets.zero,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              login ? 'Login' : 'Signup',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              login = !login;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 28),
                            child: Text(
                              login
                                  ? "Don't have an account? Signup"
                                  : "Already have an account? Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 16),
                        child: ElevatedButton(
                          onPressed: () {
                            AuthServices.signInWithGoogle(context);
                            print('Sign in with Google hogaya ');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              final auth = FirebaseAuth.instance;
                              auth.signInWithRedirect(GoogleAuthProvider());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.google,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Continue with Google',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 16),
                        child: ElevatedButton(
                          onPressed: () {
                            print('Sign in with Apple hogaya ');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.apple,
                                  size: 22,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Continue with Apple',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // static signInWithGoogle() async {
  //   try {
  //     final FirebaseAuth _auth = FirebaseAuth.instance;
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     final UserCredential authResult =
  //         await _auth.signInWithCredential(credential);
  //     final User? user = authResult.user;
  //     print('User: $user');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
}
