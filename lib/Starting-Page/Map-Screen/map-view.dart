import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto_final/Starting-Page/Map-Screen/Logic/map-logic.dart';

class MapView extends StatelessWidget {
  final MapLogic _mapLogic = MapLogic();
  final String coordinates;
  final String municipio;
  final String nombreCompleto;
  final String nombreProyecto;

  MapView({
    required this.coordinates,
    required this.municipio,
    required this.nombreCompleto,
    required this.nombreProyecto,
  });

  @override
  Widget build(BuildContext context) {
    List<String> latLng = coordinates.split(',');
    double lat = double.parse(latLng[0]);
    double lng = double.parse(latLng[1]);

    return Scaffold(
      body: FlutterMap(
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
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Municipio: $municipio'),
              Text('Nombre completo: $nombreCompleto'),
              Text('Nombre del proyecto: $nombreProyecto'),
            ],
          ),
        ),
      ),
    );
  }
}
