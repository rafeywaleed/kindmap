import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:flutterflow_ui/flutterflow_ui.dart";
import "package:kindmap/themes/KMTheme.dart";

class Permissions extends StatefulWidget {
  const Permissions({super.key});

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Permissions"),
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
                      child: Text("Permission",
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
                        'What and why are they used',
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
                      child: Text("Permission",
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
                        'What and why are they used',
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
                      child: Text("Permission",
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
                        'What and why are they used',
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
