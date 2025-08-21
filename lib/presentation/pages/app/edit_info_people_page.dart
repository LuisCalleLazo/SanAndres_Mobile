import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class EditInfoPeoplePage extends StatefulWidget {
  static String name = "edit_info_people_page";
  const EditInfoPeoplePage({super.key});

  @override
  State<EditInfoPeoplePage> createState() => _EditInfoPeoplePageState();
}

class _EditInfoPeoplePageState extends State<EditInfoPeoplePage> {
  final _formKey = GlobalKey<FormState>();
  String _currentLocation = '';
  bool _isGettingLocation = false;
  // Controladores para los campos del formulario
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    setState(
      () {
        _isGettingLocation = true;
      },
    );

    try {
      // Verificar permisos
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor activa el servicio de ubicación'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Permisos de ubicación son requeridos'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Los permisos de ubicación fueron denegados permanentemente'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Obtener ubicación
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );

      // Formatear la ubicación (puedes usar geocoding para obtener dirección si lo prefieres)
      setState(() {
        _currentLocation = '${position.latitude}, ${position.longitude}';
        _locationController.text = _currentLocation;
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error obteniendo ubicación: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isGettingLocation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Editar Perfil',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B0000)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProfilePicture(),
              const SizedBox(height: 30),
              _buildFormField(_nameController.text, 'Nombre', 'Ingresa tu nombre'),
              const SizedBox(height: 15),
              _buildFormField(
                  _lastNameController.text, 'Apellido', 'Ingresa tu apellido'),
              const SizedBox(height: 15),
              _buildFormField(
                  _emailController.text, 'Correo electrónico', 'Ingresa tu correo'),
              const SizedBox(height: 15),
              _buildFormField(
                  _phoneController.text, 'Teléfono', 'Ingresa tu teléfono'),
              const SizedBox(height: 15),
              _buildFormField(
                  _addressController.text, 'Dirección', 'Ingresa tu dirección'),
              const SizedBox(height: 15),
              _buildLocationField(),
              const SizedBox(height: 30),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ubicación actual',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  hintText: 'Presiona el botón para obtener ubicación',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8B0000)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(width: 10),
            _isGettingLocation
                ? const CircularProgressIndicator(
                    color: Color(0xFF8B0000),
                  )
                : IconButton(
                    icon:
                        const Icon(Icons.location_on, color: Color(0xFF8B0000)),
                    onPressed: _getCurrentLocation,
                    tooltip: 'Obtener ubicación actual',
                  ),
          ],
        ),
        const SizedBox(height: 5),
        if (_currentLocation.isNotEmpty)
          Text(
            'Coordenadas guardadas: $_currentLocation',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xFFD9D9D9),
            child: Icon(
              Icons.person,
              size: 60,
              color: Color(0xFF8B0000),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF8B0000),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  // Acción para cambiar foto de perfil
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, String hint, String placeholder) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(color: Color(0xFF8B0000)),
        hintText: placeholder,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF8B0000)),
          // enabledBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B0000),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        // Guardar cambios
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cambios guardados correctamente'),
            backgroundColor: Color(0xFF8B0000),
          ),
        );
      },
      child: const Text(
        'GUARDAR CAMBIOS',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
