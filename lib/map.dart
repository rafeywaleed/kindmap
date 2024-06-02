import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kindmap/components/PinBox.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LatLng? location;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    getLocation();
    loadMarkers();
  }

  Future<void> getLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      location = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> loadMarkers() async {
    final pins = await FirebaseFirestore.instance.collection('Pins').get();
    setState(() {
      markers = pins.docs.map((doc) {
        final latitude = doc['Latitude'];
        final longitude = doc['Longitude'];
        return Marker(
          point: LatLng(latitude, longitude),
          builder: (context) => GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return PinBox(
                    note: doc['Note'],
                    detail: doc['Details'],
                    image: doc['url'],
                    timeleft: doc['Timer'],
                    latitude: doc['Latitude'],
                    longitude: doc['Longitude'],
                    // if (location ==
                    //     LatLng(doc['Latitude'], doc['Longitude'])) {
                    location: location,
                    onServe: () async {
                      // Remove marker from the map
                      setState(() {
                        markers.removeWhere((marker) =>
                            marker.point == LatLng(latitude, longitude));
                      });
                      // Remove marker from Firestore

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Thank You for helping!')));
                      FirebaseFirestore.instance
                          .collection('Pins')
                          .doc(doc.id)
                          .delete();
                      var helped = await FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .get();
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .update({'helped': helped.data()!['helped'] + 1});
                      Navigator.pop(context);
                      // }
                    },
                  );
                },
              );
            },
            child: Image.asset(
              'assets/images/MapMarker.png', // Replace with your image path
              width: 50,
              height: 50,
            ),
          ),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // markers.add(Marker(
    //     point: location!,
    //     builder: (context) => const Icon(
    //           Icons.my_location,
    //           color: Colors.blue,
    //           size: 30,
    //         )));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          if (location != null)
            FlutterMap(
              options: MapOptions(
                minZoom: 0,
                maxZoom: 18,
                center: location ?? LatLng(0, 0),
                zoom: 15,
              ),
              children: [
                openStreetMapTileLayer,
                MarkerLayer(markers: markers),
              ],
            ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
