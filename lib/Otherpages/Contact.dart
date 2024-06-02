import "package:flutter/material.dart";
import "package:kindmap/themes/KMTheme.dart";

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Some random text",
                    textAlign: TextAlign.left,
                    style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18,
                          letterSpacing: 0,
                        )),
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About Report',
                  textAlign: TextAlign.center,
                  style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.red))),
              ),
              onPressed: () {},
              child: Text(
                'Report',
                textAlign: TextAlign.center,
                style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About Suggest',
                  textAlign: TextAlign.center,
                  style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(
                            color: Color.fromARGB(255, 14, 143, 53)))),
              ),
              onPressed: () {},
              child: Text(
                'Suggest',
                textAlign: TextAlign.center,
                style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
