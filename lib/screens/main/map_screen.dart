import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Карта задач'),
        backgroundColor: const Color(0xFF007BFF),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Пример координат
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('task1'),
            position: const LatLng(37.7749, -122.4194),
            infoWindow: const InfoWindow(title: 'Задача 1'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
          Marker(
            markerId: const MarkerId('task2'),
            position: const LatLng(37.7849, -122.4294),
            infoWindow: const InfoWindow(title: 'Задача 2'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          ),
        },
      ),
    );
  }
}
