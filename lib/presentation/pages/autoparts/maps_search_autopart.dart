import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:san_andres_mobile/presentation/services/location_service.dart';

class MapsSearchAutopart extends StatefulWidget {
  static String name = "maps_search_autopart";
  const MapsSearchAutopart({super.key});

  @override
  State<MapsSearchAutopart> createState() => _MapsSearchAutopartState();
}

class _MapsSearchAutopartState extends State<MapsSearchAutopart> {
  late GoogleMapController mapController;
  final LocationService _locationService = LocationService();
  LatLng? _currentPosition;
  String _errorMessage = '';
  bool _isLoading = true;

  // Posiciones de ejemplo
  final LatLng _destinationLatLng = const LatLng(37.7849, -122.4094);
  final List<LatLng> _routePoints = const [
    LatLng(37.7749, -122.4194),
    LatLng(37.7760, -122.4180),
    LatLng(37.7780, -122.4150),
    LatLng(37.7800, -122.4120),
    LatLng(37.7820, -122.4100),
    LatLng(37.7849, -122.4094),
  ];

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    try {
      final position = await _locationService.getCurrentPosition();
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
        _currentPosition = const LatLng(37.7749, -122.4194); // Valor por defecto
      });
    }
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_errorMessage),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _initLocation,
            child: const Text('Reintentar'),
          ),
          ElevatedButton(
            onPressed: _locationService.openAppSettings,
            child: const Text('Abrir configuración'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty && _currentPosition == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Mapa')),
        body: _buildErrorWidget(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _initLocation,
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition!,
          zoom: 14,
        ),
        onMapCreated: (controller) => mapController = controller,
        myLocationEnabled: true,
        myLocationButtonEnabled: false, // Usamos nuestro propio botón
        markers: {
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: _currentPosition!,
          ),
          Marker(
            markerId: const MarkerId('destination'),
            position: _destinationLatLng,
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            points: _routePoints,
            color: Colors.blue,
            width: 5,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentPosition != null) {
            mapController.animateCamera(
              CameraUpdate.newLatLng(_currentPosition!),
            );
          }
        },
        child: const Icon(Icons.gps_fixed),
      ),
    );
  }
}