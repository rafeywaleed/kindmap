import 'package:kindmap/IntroScreens/IntroScreens.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:kindmap/components/DetailBox.dart';
import 'package:kindmap/components/PinBox.dart';
import 'package:kindmap/map.dart';
import 'package:kindmap/new_Auth/nAuth.dart';
import 'package:kindmap/new_Auth/user.dart';
import 'package:kindmap/themes/kmTheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBBIuwNrITwg_fmeIkMGz2CZbkoNVKvP4g',
      appId: '1:403643543889:android:d9f0b2bf35c12e2d3ae370',
      messagingSenderId: '403643543889',
      projectId: 'kindmap-999d3',
      storageBucket: 'gs://kindmap-999d3.appspot.com',
    ),
  );

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
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
      debugShowCheckedModeBanner: false,
      // home: (FirebaseAuth.instance.currentUser != null)
      //     ? HomePage()
      //     : AuthenticationPage(),

      // home: AuthenticationPage(),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
            //BoxEx();
          } else {
            return const LoginForm();
          }
        },
      ),

      // themeMode: ThemeMode.dark,
      // darkTheme: CustomTheme.darkBase,
      // theme: CustomTheme.lightBase,
      theme: KMTheme.lightTheme,
      darkTheme: KMTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,

      routes: {
        '/auth': (context) => const LoginForm(),
        '/home': (context) => const HomePage(),
        //'Pin': (context) => PinPage(imageData: ,),
        '/camera': (context) => CameraPage(),
        '/settings': (context) => const SettingsPage(),
        '/profile': (context) => const ProfilePage(),
        '/map': (context) => const Maps(),
        '/introScreens': (context) => const IntroScreens(),
        '/try': (context) => BoxEx(),
      },
    );
  }
}

class BoxEx extends StatelessWidget {
  const BoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trying Components'),
      ),
      body: Center(
        child: Row(
          children: [
            const Align(
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  // Show PinBox as a modal bottom sheet when button is pressed
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const PinBox();
                    },
                  );
                },
                child: const Text('Show PinBox'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Show PinBox as a modal bottom sheet when button is pressed
                // showModalBottomSheet(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return DetailBox();
                //   },
                // );
              },
              child: const Text('Show DetailBox'),
            ),
          ],
        ),
      ),
    );
  }
}
