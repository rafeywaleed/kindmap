import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart' as ff;
import 'package:geolocator/geolocator.dart';
import 'package:kindmap/themes/kmTheme.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Model_PinBox.dart';
export 'Model_PinBox.dart';

class PinBox extends StatefulWidget {
  String timeleft;
  double latitude;
  double longitude;
  String note;
  String image;
  String detail;
  var onServe;
  LatLng? location;

  PinBox({
    super.key,
    required this.timeleft,
    required this.latitude,
    required this.longitude,
    required this.note,
    required this.image,
    required this.detail,
    required this.onServe,
    required this.location,
  });

  @override
  State<PinBox> createState() => _PinBoxState();
}

class _PinBoxState extends State<PinBox> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: KMTheme.of(context).secondaryBackground,
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
              //   ),
              // ),
              SizedBox(
                width: size.width * 0.4,
                height: size.width * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 0),
                      child: Text(
                        '${Geolocator.distanceBetween(widget.latitude, widget.longitude, widget.location!.latitude, widget.location!.longitude).round()}ms away',
                        style: KMTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      child: Text(
                        '${widget.timeleft} left',
                        style: KMTheme.of(context).bodyMedium.override(
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
                  color: KMTheme.of(context).secondaryText,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Note: ${widget.note}\n\nLocation Detail: ${widget.detail}',
                    style: KMTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: KMTheme.of(context).lineColor,
                          fontSize: 15,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 12, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    NavigateToLocation(widget.latitude, widget.longitude);
                    // print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: KMTheme.of(context).primaryBackground,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Text(
                    'Navigate',
                    style: KMTheme.of(context).bodyLarge.override(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: ElevatedButton(
                  onPressed: widget.onServe,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: KMTheme.of(context).primary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 80),
                  ),
                  child: Text(
                    'SERVED',
                    style: KMTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color: KMTheme.of(context).primaryBackground,
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

  void NavigateToLocation(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
