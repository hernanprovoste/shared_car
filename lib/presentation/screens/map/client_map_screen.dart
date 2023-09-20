import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClienteMapScreen extends StatefulWidget {
  static const String name = 'client_map_screen';

  const ClienteMapScreen({super.key});

  @override
  State<ClienteMapScreen> createState() => _ClienteMapScreenState();
}

class _ClienteMapScreenState extends State<ClienteMapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
    )
      ));
  }
}
