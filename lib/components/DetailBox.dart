import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart' as ff;
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Model_DetailBox.dart';
export 'Model_DetailBox.dart';

class DetailBox extends StatefulWidget {
  DetailBox({
    super.key,
    required this.docName,
    required this.location,
  });

  String docName;
  LatLng location;

  @override
  State<DetailBox> createState() => _DetailBoxState();
}

class _DetailBoxState extends State<DetailBox> {
  @override
  Widget build(BuildContext context) {
    LatLng? location;

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

    Future getLocation() async {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position temp = await _determinePosition();
      setState(() {
        location = LatLng(temp.latitude, temp.longitude);
      });
    }

    @override
    void initState() {
      getLocation();
      super.initState();
    }

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ff.FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3B1D2429),
              offset: Offset(
                0.0,
                -3,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Container(
              //   width: size.width * 0.4,
              //   height: size.width * 0.4,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFF2A2A2A),
              //     borderRadius: BorderRadius.circular(10),
              //   ),),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Pins')
                      .doc(widget.docName)
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            snapshot.data!['url'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                    return const Center(child: LinearProgressIndicator());
                  })),

              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 0),
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Pins')
                            .doc(widget.docName)
                            .snapshots(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return FittedBox(
                              child: Text(
                                '${Geolocator.distanceBetween(snapshot.data!['Latitude'], snapshot.data!['Longitude'], widget.location.latitude, widget.location.longitude).round()}ms away',
                                style: ff.FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 22.5,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            );
                          }
                          return const Center(child: LinearProgressIndicator());
                        }),
                        // Text(
                        //   '5ms away',
                        //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //         fontFamily: 'Poppins',
                        //         fontSize: 18,
                        //         letterSpacing: 0,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      child: Text(
                        '3 hrs left',
                        style:
                            ff.FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                    color: ff.FlutterFlowTheme.of(context).secondaryText,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Pins')
                          .doc(widget.docName)
                          .snapshots(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              child: Text(
                                'Note: ${snapshot.data!['Note']}\n\nLocation Detail: ${snapshot.data!['Details']}',
                                style: ff.FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: ff.FlutterFlowTheme.of(context)
                                          .lineColor,
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          );
                        }
                        return const Center(child: LinearProgressIndicator());
                      }),
                      // Text(
                      //   'Note: An elderly man seeking for Food\n\nLocation Detail: Beside MJCET Gate',
                      //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //         fontFamily: 'Poppins',
                      //         color: FlutterFlowTheme.of(context).lineColor,
                      //         fontSize: 15,
                      //         letterSpacing: 0,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      // ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 20),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    // Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: ff.FlutterFlowTheme.of(context).primary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 80),
                  ),
                  child: Text(
                    'DONE',
                    style: ff.FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color:
                              ff.FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
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
