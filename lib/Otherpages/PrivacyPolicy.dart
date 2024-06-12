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
              padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
              child: Column(
                children: [
                  // Text(
                  //   'PrivacyPolicy Blah blah blah',
                  //   textAlign: TextAlign.center,
                  //   style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                  //         fontFamily: 'Readex Pro',
                  //         fontSize: 15,
                  //         letterSpacing: 0,
                  //         fontWeight: FontWeight.normal,
                  //       ),
                  // ),
                  Text(
                      "Privacy Policy\n\nYour privacy is important to us. It is KindMap's policy to respect your privacy regarding any information we may collect from you across our app, KindMap, and other sites we own and operate.\n\nInformation We Collect\nWe only collect information about you if we have a reason to do so–for example, to provide our services, to communicate with you, or to make our services better.\n\nInformation You Provide to Us\nWe collect information that you voluntarily provide to us when you:\n\nCreate an account\nUse our services\nContact us for support\nParticipate in surveys or promotions\n\nThe information we collect may include:\nName\nEmail address\nLocation information\nUser-generated content (e.g., pins, comments)\nInformation We Collect Automatically\n\nWhen you use our services, we may automatically collect certain information, including:\nDevice information (e.g., IP address, device type)\nUsage information (e.g., pages visited, interactions with our app)\nLocation information (if you enable location services)\nHow We Use Your Information\n\nWe may use the information we collect for various purposes, including to:\nProvide, maintain, and improve our services\nCommunicate with you about your account or our services\nPersonalize your experience\nRespond to your inquiries and provide support\nSharing Your Information\n\nWe may share your information with third parties for the following purposes:\nWith service providers to help us operate our services\nWith law enforcement or government authorities if required by law\nWith your consent or at your direction\n\nData Retention\nWe will retain your information for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.\n\nSecurity\nWe take reasonable measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure.\n\nChanges to This Privacy Policy\nWe may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.\n\nContact Us\nIf you have any questions about this Privacy Policy, please contact us at kindmap02@gmail.com.\n\n",
                      textAlign: TextAlign.start,
                      style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
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
