import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Future<Position> getCurrentPosition() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      throw Exception('Location permissions denied');
    }

    return await _geolocator.getCurrentPosition();
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar si los servicios de ubicación están habilitados
    serviceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<void> openAppSettings() async {
    await _geolocator.openAppSettings();
  }

  Future<void> openLocationSettings() async {
    await _geolocator.openLocationSettings();
  }

  Stream<Position> getPositionStream() {
    return _geolocator.getPositionStream();
  }
}