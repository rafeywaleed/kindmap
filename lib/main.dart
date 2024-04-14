import 'package:kindmap/IntroScreens/IntroScreens.dart';
import 'package:kindmap/themes/kmTheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/Auth/Authentication.dart';
import 'package:kindmap/Camera.dart';
import 'package:kindmap/Homepage/HomePage.dart';
import 'package:kindmap/IntroScreens/IntroScreens.dart';
import 'package:kindmap/Pin/PinPage.dart';
import 'package:kindmap/Profile/ProfilePage.dart';
import 'package:kindmap/Settings/SettingsPage.dart';
import 'package:kindmap/themes/kmTheme.dart';

import 'package:provider/provider.dart';
//import 'package:km/themes/old_theme.dart';

//import 'package:km/IntroScreens/Introscreen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KindMap',
      // home: (FirebaseAuth.instance.currentUser != null)
      //     ? HomePage()
      //     : AuthenticationPage(),
      home: AuthenticationPage(),
      // themeMode: ThemeMode.dark,
      // darkTheme: CustomTheme.darkBase,
      // theme: CustomTheme.lightBase,
      theme: KMTheme.lightTheme,
      darkTheme: KMTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,

      routes: {
        'Auth': (context) => AuthenticationPage(),
        'Home': (context) => HomePage(),
        //'Pin': (context) => PinPage(imageData: ,),
        'Camera': (context) => CameraPage(),
        'Settings': (context) => SettingsPage(),
        'Profile': (context) => ProfilePage(),
        'IntroScreens': (context) => IntroScreens(),
      },
    );
  }
}
