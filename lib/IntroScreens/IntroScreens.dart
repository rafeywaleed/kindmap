import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Model_IntroScreens.dart';
export 'Model_IntroScreens.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  late IntroScreensModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroScreensModel());

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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Container(
                  width: double.infinity,
                  height: 878,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                        child: PageView(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (_) => setState(() {}),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 395,
                                        height: 370,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              'assets/images/Screenshot_2024-02-25_195318.png',
                                              width: 326,
                                              height: 407,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            'assets/images/Screenshot_2024-02-25_195346.png',
                                            width: 393,
                                            height: 543,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 395,
                                        height: 370,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              'assets/images/Screenshot_2024-02-25_195318.png',
                                              width: 326,
                                              height: 407,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            'assets/images/Screenshot_2024-02-25_195435.png',
                                            width: 393,
                                            height: 699,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'assets/images/Screenshot_2024-02-25_201212.png',
                                                  width: 487,
                                                  height: 691,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 1),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.of(context).pushNamed('Home');
                                    },
                                    text: 'Done',
                                    options: FFButtonOptions(
                                      height: 27,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: FlutterFlowTheme.of(context).info,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0,
                                          ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 5,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 3,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 8,
                              dotColor: FlutterFlowTheme.of(context).accent1,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).error,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
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
