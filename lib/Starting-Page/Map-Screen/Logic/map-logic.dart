import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapLogic {
  final MapController _mapController = MapController();

  MapController get mapController => _mapController;

  void moveToLocation(String coordinates) {
    List<String> latLng = coordinates.split(',');
    double lat = double.parse(latLng[0]);
    double lng = double.parse(latLng[1]);
    _mapController.move(LatLng(lat, lng), 15.0);
  }
}
