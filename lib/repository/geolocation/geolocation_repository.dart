import 'package:food_delivery_app_flutter/repository/geolocation/base_geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository extends BaseGeolocationRepository {
  GeolocationRepository();

  @override
  Future<Position> getCurrentLocation() async {
    final Position _position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return _position;
  }
}
