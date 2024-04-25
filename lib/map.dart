import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LatLng? location;

  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    // Request location permission
    var status = await Permission.location.request();
    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      // Handle denied permissions
      return;
    }

    await getLocation();
  }

  Future<void> getLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request it
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return;
      }
    }

    // Get the current position
    Position temp = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      location = LatLng(temp.latitude, temp.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: FutureBuilder<void>(
        future: getLocation(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FlutterMap(
              options: MapOptions(
                minZoom: 0,
                maxZoom: 18,
                center: location ?? LatLng(0, 0), // Fallback to (0, 0)
                zoom: 15,
                interactiveFlags: InteractiveFlag.all,
              ),
              children: [
                openStreetMapTileLayer,
                if (location != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: location!,
                        width: 60,
                        height: 60,
                        rotateAlignment: Alignment.centerLeft,
                        builder: (_) => const Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
              ],
            );
          }
        },
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
