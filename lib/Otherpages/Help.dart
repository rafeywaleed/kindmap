import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:flutterflow_ui/flutterflow_ui.dart";
import "package:kindmap/themes/KMTheme.dart";

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Question 1",
                          textAlign: TextAlign.left,
                          style:
                              KMTheme.of(context).bodyMedium.overrideTextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'Answer 1',
                        textAlign: TextAlign.left,
                        style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Question 2",
                          textAlign: TextAlign.left,
                          style:
                              KMTheme.of(context).bodyMedium.overrideTextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'Answer 2',
                        textAlign: TextAlign.left,
                        style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Question 3",
                          textAlign: TextAlign.left,
                          style:
                              KMTheme.of(context).bodyMedium.overrideTextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'Answer 3',
                        textAlign: TextAlign.left,
                        style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'You can watch the tutorial \n Youtube link here',
                        textAlign: TextAlign.left,
                        style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'Tell us, how can we help you via mail',
                        textAlign: TextAlign.left,
                        style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
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
    );
  }
}
