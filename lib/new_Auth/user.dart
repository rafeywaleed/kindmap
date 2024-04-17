import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
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
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).alternate,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFAC6C3),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 0,
                //     color: Color(0x33000000),
                //     offset: Offset(
                //       4,
                //       4,
                //     ),
                //   )
                // ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                shape: BoxShape.rectangle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
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
                        alignment: AlignmentDirectional(0, 0),
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
                              alignment: AlignmentDirectional(0, -1),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
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
              color: const Color.fromARGB(255, 229, 229, 229),
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey,
              //     blurRadius: 10.0,
              //     offset: Offset(0, 5),
              //   ),
              // ],
            ),
            child: Form(
              key: _formKey,
              child: Container(
                //padding: EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ======== Full Name ========
                    login
                        ? Container()
                        : TextFormField(
                            key: ValueKey('Full Name'),
                            autofocus: true,
                            autofillHints: [AutofillHints.email],
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
                              contentPadding: EdgeInsets.all(24),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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

                    // ======== Email ========
                    // TextFormField(
                    //   key: ValueKey('email'),
                    //   decoration: InputDecoration(
                    //     hintText: 'Enter Email',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty || !value.contains('@')) {
                    //       return 'Please Enter valid Email';
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    //   onSaved: (value) {
                    //     setState(() {
                    //       email = value!;
                    //     });
                    //   },
                    // ),

                    TextFormField(
                      key: ValueKey('email'),
                      autofocus: true,
                      autofillHints: [AutofillHints.email],
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsets.all(24),
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
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

                    // ======== Password ========
                    // TextFormField(
                    //   key: ValueKey('password'),
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     hintText: 'Enter Password',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.length < 6) {
                    //       return 'Please Enter Password of min length 6';
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    //   onSaved: (value) {
                    //     setState(() {
                    //       password = value!;
                    //     });
                    //   },
                    // ),

                    TextFormField(
                      key: ValueKey('password'),
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsets.all(24),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Readex Pro',
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

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 55,
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
                          child: Text(login ? 'Login' : 'Signup')),
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
                        child: Text(login
                            ? "Don't have an account? Signup"
                            : "Already have an account? Login"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
