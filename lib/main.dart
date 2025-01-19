import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:san_andres_mobile/config/db/autoparts/autoparts_init_db.dart';
import 'package:san_andres_mobile/config/router/app_router.dart';
import 'package:san_andres_mobile/config/theme/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // Initialize database
  await AutopartsInitDb.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Fiver Bob',
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
