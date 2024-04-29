import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutterflow_ui/flutterflow_ui.dart';
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
          rotate: false,
          point: LatLng(latitude, longitude),
          builder: (_) => IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const PinBox();
                },
              );
            },
            icon: const Icon(
              Icons.location_pin,
              size: 60,
              color: Colors.red,
            ),
          ),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          if (location != null)
            FlutterMap(
              options: MapOptions(
                minZoom: 8,
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
