import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LatLng? location;
  double? x;
  double? y;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Position temp = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      location = LatLng(temp.latitude, temp.longitude);
      x = temp.latitude;
      y = temp.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
        ),
        body: FlutterMap(
          options: MapOptions(
              minZoom: 0,
              maxZoom: 18,
              center: location,
              zoom: 15,
              interactiveFlags: InteractiveFlag.all),
          children: [
            openStreetMapTileLayer,
            MarkerLayer(
              markers: [
                Marker(
                    point: LatLng(17.428101, 78.435204),
                    width: 60,
                    height: 60,
                    rotateAlignment: Alignment.centerLeft,
                    builder: (_) => const Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ))
              ],
            )
          ],
        ));
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
