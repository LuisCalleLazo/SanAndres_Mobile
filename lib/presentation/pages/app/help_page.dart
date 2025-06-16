import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  static String name = "help_page";
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'San Andres',
    packageName: 'san_andres_mobile',
    version: '35',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  final List<Map<String, String>> libraries = [
    {
      'name': 'Flutter',
      'description':
          'Framework de UI de Google para aplicaciones nativas multiplataforma',
      'url': 'https://flutter.dev'
    },
    {
      'name': 'cupertino_icons',
      'description': 'Iconos en estilo iOS para aplicaciones Flutter',
      'url': 'https://pub.dev/packages/cupertino_icons'
    },
    {
      'name': 'go_router',
      'description': 'Sistema de enrutamiento declarativo para Flutter',
      'url': 'https://pub.dev/packages/go_router'
    },
    {
      'name': 'provider',
      'description': 'Gestión de estado sencilla y escalable',
      'url': 'https://pub.dev/packages/provider'
    },
    {
      'name': 'flutter_dotenv',
      'description': 'Carga variables de entorno desde un archivo .env',
      'url': 'https://pub.dev/packages/flutter_dotenv'
    },
    {
      'name': 'dio',
      'description': 'Cliente HTTP poderoso para Dart/Flutter',
      'url': 'https://pub.dev/packages/dio'
    },
    {
      'name': 'flutter_secure_storage',
      'description': 'Almacenamiento seguro de datos en iOS/Android',
      'url': 'https://pub.dev/packages/flutter_secure_storage'
    },
    {
      'name': 'jwt_decode',
      'description': 'Decodificador simple de tokens JWT',
      'url': 'https://pub.dev/packages/jwt_decode'
    },
    {
      'name': 'jwt_decoder',
      'description': 'Otra librería para decodificar tokens JWT',
      'url': 'https://pub.dev/packages/jwt_decoder'
    },
    {
      'name': 'image_picker',
      'description': 'Seleccionar imágenes de la galería o cámara',
      'url': 'https://pub.dev/packages/image_picker'
    },
    {
      'name': 'visibility_detector',
      'description': 'Detecta cuando los widgets son visibles en pantalla',
      'url': 'https://pub.dev/packages/visibility_detector'
    },
    {
      'name': 'google_fonts',
      'description': 'Integra fácilmente fuentes de Google Fonts',
      'url': 'https://pub.dev/packages/google_fonts'
    },
    {
      'name': 'flutter_pdfview',
      'description': 'Visualizador de PDFs nativo para Flutter',
      'url': 'https://pub.dev/packages/flutter_pdfview'
    },
    {
      'name': 'share_plus',
      'description': 'Compartir contenido desde la aplicación',
      'url': 'https://pub.dev/packages/share_plus'
    },
    {
      'name': 'path_provider',
      'description': 'Encuentra rutas comunes en el sistema de archivos',
      'url': 'https://pub.dev/packages/path_provider'
    },
    {
      'name': 'http',
      'description': 'Cliente HTTP para hacer peticiones web',
      'url': 'https://pub.dev/packages/http'
    },
    {
      'name': 'sqflite',
      'description': 'SQLite para Flutter, base de datos local',
      'url': 'https://pub.dev/packages/sqflite'
    },
    {
      'name': 'path',
      'description': 'Utilidades para manejar rutas de archivos',
      'url': 'https://pub.dev/packages/path'
    },
    {
      'name': 'geolocator',
      'description': 'Geolocalización y permisos de ubicación',
      'url': 'https://pub.dev/packages/geolocator'
    },
    {
      'name': 'google_maps_flutter',
      'description': 'Integración de Google Maps en Flutter',
      'url': 'https://pub.dev/packages/google_maps_flutter'
    },
    {
      'name': 'flutter_polyline_points',
      'description': 'Genera puntos para polilíneas en mapas',
      'url': 'https://pub.dev/packages/flutter_polyline_points'
    },
    {
      'name': 'flutter_launcher_icons',
      'description': 'Genera íconos para la aplicación',
      'url': 'https://pub.dev/packages/flutter_launcher_icons'
    },
    {
      'name': 'url_launcher',
      'description': 'Abre URLs en el navegador externo',
      'url': 'https://pub.dev/packages/url_launcher'
    },
    {
      'name': 'package_info_plus',
      'description': 'Obtiene información sobre el paquete de la aplicación',
      'url': 'https://pub.dev/packages/package_info_plus'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B0000), // Rojo oscuro
      appBar: AppBar(
        title: const Text('Información de la App',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF8B0000),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppInfoCard(),
            const SizedBox(height: 24),
            const Text(
              'Librerías utilizadas',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...libraries.map((lib) => _buildLibraryCard(lib)),
            const SizedBox(height: 24),
            _buildDeveloperInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppInfoCard() {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información de la aplicación',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Nombre', _packageInfo.appName),
            _buildInfoRow('Versión',
                '${_packageInfo.version} (${_packageInfo.buildNumber})'),
            _buildInfoRow('Paquete', _packageInfo.packageName),
            const SizedBox(height: 12),
            const Text(
              'Descripción:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Aquí puedes colocar una descripción detallada de tu aplicación y sus funcionalidades principales.',
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B0000),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLibraryCard(Map<String, String> library) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _launchUrl(library['url']!),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(Icons.code, color: Color(0xFF8B0000)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      library['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF8B0000),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      library['description']!,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Color(0xFF8B0000)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperInfo() {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Desarrollador',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
            const SizedBox(height: 12),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF8B0000),
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Nombre', 'TheDartpad'),
            _buildInfoRow('Contacto', 'callelazodeynarluis@gmail.com'),
            _buildInfoRow('Sitio web',
                'https://github.com/LuisCalleLazo/LuisCalleLazo.github.io'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.public, color: Color(0xFF8B0000)),
                  onPressed: () => _launchUrl('https://tuweb.com'),
                ),
                IconButton(
                  icon: const Icon(Icons.email, color: Color(0xFF8B0000)),
                  onPressed: () => _launchUrl('mailto:email@ejemplo.com'),
                ),
                IconButton(
                  icon: const Icon(Icons.code, color: Color(0xFF8B0000)),
                  onPressed: () => _launchUrl('https://github.com/turepo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
