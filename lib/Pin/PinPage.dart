// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindmap/Pin/PinConfirmation.dart';
import 'package:kindmap/themes/kmTheme.dart';
import 'package:kindmap/themes/old_theme.dart';
import 'package:provider/provider.dart';

import 'Model_PinPage.dart';
export 'Model_PinPage.dart';

class PinPage extends StatefulWidget {
  final String imagePath;

  const PinPage({super.key, required this.imagePath});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> with TickerProviderStateMixin {
  LatLng? location;
  final db = FirebaseFirestore.instance;
  String? url;
  String? docName;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // Future getLocation() async {
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();

  //   Position temp = await _determinePosition();
  //   setState(() {
  //     location = LatLng(temp.latitude, temp.longitude);
  //   });
  // }

  Future<void> getLocation() async {
    try {
      // Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }

      // Get current position
      Position temp = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        location = LatLng(temp.latitude, temp.longitude);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to get location: $e'),
      ));
    }
  }

  Future uploadImage() async {
    try {
      final path =
          'Images/${DateTime.now().millisecondsSinceEpoch}.${widget.imagePath.split('.').last}';
      final fbs = FirebaseStorage.instance.ref().child(path);

      UploadTask uploadTask = fbs.putFile(File(widget.imagePath));
      final snapshot = await uploadTask.whenComplete(() {});
      var temp = await snapshot.ref.getDownloadURL().whenComplete(() {});
      setState(() {
        url = temp;
        docName =
            '${location!.latitude}-${location!.longitude}-${TimeOfDay.now().hour}:${TimeOfDay.now().minute}';
        db.collection('Pins').doc(docName).set({
          'Note': _model.textController1.text == ""
              ? '(none)'
              : _model.textController1.text,
          'Details': _model.textController2.text == ""
              ? '(none)'
              : _model.textController2.text,
          'Timer': _model.dropDownValue ?? '3 hr',
          'Latitude': location!.latitude,
          'Longitude': location!.longitude,
          'url': url!,
          'UploadTime': DateTime.now()
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Upload Complete')));
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // Future<void> sendNotification(String topic) async {
  //   final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  //   final serverKey =
  //       'AAAAXfsHsVE:APA91bGiEJp1y1T2h9VEHr0y-u0LoGIty04jFaHea0xtvwsUXOutSi2F5lRkwhEQmHV4MmQs2kEtoHhkxX1LDAeSGeHuk5ZzYZ5Gkec2oTUmqaktuf3Gv3Q4KuMsjpG2M6w76VHaxxbh'; // Replace with your FCM server key
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'key=$serverKey',
  //   };
  //   final body = {
  //     'notification': {
  //       'title': 'Someone nearby needs help.',
  //       'body': _model.textController1.text,
  //     },
  //     'priority': 'high',
  //     'to': '/topics/$topic', // Specify the topic here
  //   };
  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode(body),
  //   );
  //   if (response.statusCode == 200) {
  //     print('Notification sent successfully to topic: $topic');
  //   } else {
  //     print(
  //         'Failed to send notification to topic: $topic. Error: ${response.reasonPhrase}');
  //   }
  // }

  // Future<void> sendNotificationsWithinRadius(
  //     String topic, double markerLat, double markerLng) async {
  //   Position currentPosition = await Geolocator.getCurrentPosition();

  //   double distanceInMeters = Geolocator.distanceBetween(
  //       currentPosition.latitude,
  //       currentPosition.longitude,
  //       markerLat,markerLng);

  //   double distanceInKm = distanceInMeters / 1000;

  //   if (distanceInKm <= 3) {
  //     await sendNotification(topic);
  //   }
  // }

  // Future<void> sendNotificationsWithinRadius(
  //     String topic, double markerLat, double markerLng) async {
  //   try {
  //     if (location == null) {
  //       throw 'Location not available';
  //     }

  //     // Calculate distance between current location and marker
  //     double distanceInMeters = Geolocator.distanceBetween(
  //       location!.latitude,
  //       location!.longitude,
  //       markerLat,
  //       markerLng,
  //     );
  //     double distanceInKm = distanceInMeters / 1000;

  //     if (distanceInKm <= 1) {
  //       // Send notification
  //       await sendNotification(topic);
  //     }
  //   } catch (e) {
  //     print('Error sending notification: $e');
  //   }
  // }

  // Future<void> sendNotification(String topic) async {
  //   try {
  //     final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  //     final serverKey =
  //         'AAAAXfsHsVE:APA91bGiEJp1y1T2h9VEHr0y-u0LoGIty04jFaHea0xtvwsUXOutSi2F5lRkwhEQmHV4MmQs2kEtoHhkxX1LDAeSGeHuk5ZzYZ5Gkec2oTUmqaktuf3Gv3Q4KuMsjpG2M6w76VHaxxbh'; // Replace with your FCM server key
  //     final headers = {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'key=$serverKey',
  //     };
  //     final body = {
  //       'notification': {
  //         'title': 'Someone nearby needs help.',
  //         'body': _model.textController1.text,
  //       },
  //       'priority': 'high',
  //       'to': '/topics/$topic', // Specify the topic here
  //     };
  //     final response = await http.post(
  //       url,
  //       headers: headers,
  //       body: jsonEncode(body),
  //     );
  //     if (response.statusCode == 200) {
  //       print('Notification sent successfully to topic: $topic');
  //     } else {
  //       print(
  //           'Failed to send notification to topic: $topic. Error: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     print('Error sending notification: $e');
  //   }
  // }
  Future<String> getAccessToken() async {
    final serviceAccountCredentials = ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "project_id": "kindmap-999d3",
      "private_key_id": "17c31e6a632800b89dcc51ea5741db18908734d5",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCTRc9ik4ni99tP\nFc9JjUcZPdQ3/WeXbSZdh09Lbpjmq89G86qQpwv+KwojXK8w5wgSuee07ps2Jyum\nTGDE8SQqx5rvT0RdhBRZ+lJiKFHsORB4xhzFwnhYNDYHI1ZQYNArvprBQ70kzucd\nibpV2/5/R7codjFLji4+JKMuPL3NF8JjZ7rEBrAxgWQlgwId4ab0P1y3Db0gmJLE\nTXwMqh2AlPHi8CK0n+jrEQ/0hOAwSd/PXAczFGHqDX+zdMQ9OJ+/7457YHM2mx7h\nJJDDb1Nvv9NbgGQA4gJ3WdbPeJPJvFroc2IWYjTKlyq0KY4oOCRjW34MYTUA4ggc\ng0CqzvqvAgMBAAECggEAArlUVCTuycwUJNrTlNna76G/9px7xDETIsC5cTzlnBf1\nGKwHbW8sNB0fWLcX+xtoKqcrR3fwVqiT0JrHYW0lDPDYh0ZGjpo+TB8VU1Zz6XQc\nFLfJWXO23nQcxGCyxyrQlDaNeIykXMrCOz7MZlZ61xIrAOxquKneZheEYyW2zFUg\necAe+ESb7an/i0oDsyRAUTega+eLoqYehhNtXzZFnY4BFAJZu4X2zhi9jnKpPFSr\n889oIbHmAbZ/A+mYHZGYqOAvNH7PoB9t16W2Ewex8nk1Wbpki+emwwul49NfgjaJ\nmAYGyXu9a5uhZ2OOSTIrn1iJKR8JhlGA/OKo5Zn2IQKBgQDMwsXZL2u4EgGNfDAL\nMG0Ubrqe3X792GEJEe7O9GCky6YSWClYk7roe8ZAvQtzPU3v+jd4z4S69EpBILo0\nCl2852bMJn+GgEvSjIYvmvNRJWc4bS9KQhV8qbigFrNmaHa7VFEYka5/JZ2QUGDJ\n2wDw5pjGfN2rFEk1YnqU2W59oQKBgQC4IEcOqILaE3oXpdy8CttKcPluXVkzm56H\nKAyjmNZfgYSLjiKtbtpxceMm9mGXrpzXMoT6SV3xu9M2LhKW2hwPn9yw3sicrzAn\nmijx8yL/DT5ZVYDOo4xtBFj26YAC+4m9Bu02XkJj3/UPWdTfmQr1o8w4JLbl5Mbe\nZp31pQ52TwKBgDuwCzxkNmJR3WIA8YBRfXqXTI9CweH9UUvzjkmFsyZWtvJiAKtx\nZOqgKgp1EQFmvXFW3xS4aViWHY8emyjQXMLUMYMRNdtfSrr1e6gk4wikfpJUQZTD\n7r+IOelwtJsFmJbC3WDsFpG5xVRsGcq9rGiMz7wMahGUuEJ3koQRXcQBAoGAVmxI\nDfhIWuWzc/AVGGocHefDG+tS2CdeFGBW9l7hmDhppztSyYbznzXugbY5foGl+lgr\nFHNlVfZsH80mSoobi7XkV1xqWyjbeGsidtZBgeeMcU/xwov/eJgGzfYxcLTyJLhg\nlRlPHiPbmZX3le/2te9pBp0s/+EO+wq9b7RGgn8CgYBYL4ifTzjLYmpkX2tpI68L\nSK6JA8XbglHdllKq1QuGmX7XkpEGPj/v6lo/KHDMhTj6ysM4rn9/0IqXKlVHbC+W\n02NuRbrpOIRg9kKcuOKInGTae7GCmKbC3/d2BsMHkFs3831GxUp9VVckhuQDZXiG\n4/kYhaBJwRaqpEjWSwpPww==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-ga6hv@kindmap-999d3.iam.gserviceaccount.com",
      "client_id": "109937053761461466716",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ga6hv%40kindmap-999d3.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    });

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    var client =
        await clientViaServiceAccount(serviceAccountCredentials, scopes);
    return client.credentials.accessToken.data;
  }

  Future<void> sendNotification(String topic) async {
    final fburl = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/kindmap-999d3/messages:send');
    final accessToken = await getAccessToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final body = {
      'notification': {
        'title': 'KindMap',
        'body': 'Someone nearby needs help.',
      },
      'priority': 'high',
      'topic': '/topics/$topic',
    };
    final response = await http.post(
      fburl,
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      print('Notification sent successfully to topic: $topic');
    } else {
      print(
          'Failed to send notification to topic: $topic. Error: ${response.reasonPhrase}');
    }
  }

  late PinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, -250),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 90),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    getLocation();
    _model = createModel(context, () => PinModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: KMTheme.of(context).accent4,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 12, 5, 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor:
                                  KMTheme.of(context).secondaryBackground,
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: KMTheme.of(context).primaryText,
                                size: 20,
                              ),
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  fillColor:
                                      KMTheme.of(context).secondaryBackground,
                                  icon: Icon(
                                    Icons.keyboard_control_outlined,
                                    color: KMTheme.of(context).primaryText,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: KMTheme.of(context).secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(File(widget.imagePath)),
                                // image: Image.asset(
                                //   'assets/images/Homeless-1.jpg',
                                // ).image,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: KMTheme.of(context).secondaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                    child: Container(
                                      width: double.infinity,
                                      //height: 300,
                                      decoration: BoxDecoration(
                                        color: KMTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5, 0, 5, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  'Add a note: ',
                                                  style: KMTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        fontSize: 22,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            KMTheme.of(context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 8, 8),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController1,
                                                  focusNode: _model
                                                      .textFieldFocusNode1,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        KMTheme.of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              letterSpacing: 0,
                                                            ),
                                                    hintText:
                                                        'ex: Food, Money\n(optional)',
                                                    hintStyle:
                                                        KMTheme.of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              letterSpacing: 0,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .secondaryText,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .primary,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .error,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .error,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                  ),
                                                  style: KMTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                                  maxLines: 3,
                                                  minLines: null,
                                                  validator: _model
                                                      .textController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  'Location details:',
                                                  style: KMTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        fontSize: 22,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 8, 8),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController2,
                                                  focusNode: _model
                                                      .textFieldFocusNode2,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        KMTheme.of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              letterSpacing: 0,
                                                            ),
                                                    hintText: '(optional)',
                                                    hintStyle:
                                                        KMTheme.of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              letterSpacing: 0,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .secondaryText,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .primary,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .error,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            KMTheme.of(context)
                                                                .error,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                  ),
                                                  style: KMTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                                  minLines: null,
                                                  validator: _model
                                                      .textController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  'Timer:',
                                                  style: KMTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        fontSize: 22,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(15, 0, 0, 0),
                                                child: FittedBox(
                                                  child: Text(
                                                    'Set the time, when the location you pinned\nshould disappear from the map',
                                                    style: KMTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: KMTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                          fontSize: 15,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: DropdownButton<String>(
                                                value: _model.dropDownValue,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _model.dropDownValue =
                                                        newValue!;
                                                  });
                                                },
                                                items: <String>[
                                                  'Default (3 hrs)',
                                                  '1 hr',
                                                  '5 hr',
                                                  '10 hr',
                                                  '24 hr'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                // style: KMTheme.of(context).typography.bodyText1,
                                                hint: const Text(
                                                    'Default (3 hrs)'),
                                                icon: const Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  // color: KMTheme.of(context).colorScheme.secondary,
                                                  size: 24,
                                                ),
                                                isExpanded: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: KMTheme.of(context).primaryBackground,
              ),
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await uploadImage();
                        await sendNotification('need_help');
                        // await sendNotificationsWithinRadius('need_help',
                        //     location!.latitude, location!.longitude);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PinConfirmation(docName: docName!)));
                      },
                      text: 'PIN',
                      icon: const Icon(
                        Icons.pin_drop,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: KMTheme.of(context).primary,
                        textStyle: KMTheme.of(context).titleSmall.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: KMTheme.of(context).secondary,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
          ],
        ),
      ),
    );
  }
}
