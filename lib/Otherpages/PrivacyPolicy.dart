import "package:flutter/material.dart";
import "package:kindmap/themes/KMTheme.dart";

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PrivacyPolicy"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Column(
                children: [
                  Text(
                    'PrivacyPolicy Blah blah blah',
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
