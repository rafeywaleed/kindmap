import "package:flutter/material.dart";
import "package:kindmap/themes/KMTheme.dart";

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Column(
                children: [
                  Text(
                    'About Notificationss',
                    textAlign: TextAlign.center,
                    style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 15,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Text("What are they and why does that mean",
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
