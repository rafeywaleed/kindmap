import "package:flutter/material.dart";
import "package:kindmap/themes/KMTheme.dart";

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Donate"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: size.height * 0.3,
                width: size.width,
                color: KMTheme.of(context).secondaryText,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                        size: size.height * 0.1,
                        color: KMTheme.of(context).secondaryBackground,
                        Icons.thunderstorm_outlined)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'This feature will be \navailable soon',
                    textAlign: TextAlign.center,
                    style: KMTheme.of(context).bodyMedium.overrideTextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 22.5,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
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
