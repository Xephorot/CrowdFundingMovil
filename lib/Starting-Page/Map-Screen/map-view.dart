// map_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto_final/Starting-Page/Map-Screen/Logic/map-logic.dart';


class MapView extends StatelessWidget {
  final MapLogic _mapLogic = MapLogic();
  final String coordinates;

  MapView({required this.coordinates});

  @override
  Widget build(BuildContext context) {
    List<String> latLng = coordinates.split(',');
    double lat = double.parse(latLng[0]);
    double lng = double.parse(latLng[1]);

    return FlutterMap(
      mapController: _mapLogic.mapController,
      options: MapOptions(
        center: LatLng(lat, lng),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(lat, lng),
              builder: (ctx) => const Icon(Icons.location_on, color: Colors.red,),
            ),
          ],
        ),
      ],
    );
  }
}
