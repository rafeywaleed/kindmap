import "package:flutter/material.dart";
import "package:kindmap/themes/KMTheme.dart";

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Column(
                children: [
                  Text(
                    'About Suggest',
                    textAlign: TextAlign.center,
                    style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 15,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Text("Some random text",
                      textAlign: TextAlign.left,
                      style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            letterSpacing: 0,
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
