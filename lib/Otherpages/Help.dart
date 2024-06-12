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
                      child: Text("How to change avatar",
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
                        "Double click on your avatar and a change avatar option should appear on the profile page, click it  And you may change your avatar with the given options",
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
                      child: Text("How to change name",
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
                        'Simply go to the side bar and click profileFind the change name button in the profile page and proceed',
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
                      child: Text("How to change the password ",
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
                        'Change in passwords can be done through the profile page from Settings on the side barSimply give your current password and the password that you want it to change to',
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
                      child: Text("Suggetion or Report",
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
                        'For any suggestion or report you can go to Contact page of sidemenu bar',
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
                      child: Text("Tip:",
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
                        'You can go to profile page by simply double tapping you profile on sidemenu',
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
                        'You can watch the tutorial Youtube link here',
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
