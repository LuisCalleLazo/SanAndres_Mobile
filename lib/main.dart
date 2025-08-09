import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/config/router/app_router.dart';
import 'package:san_andres_mobile/config/theme/app_theme.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';
import 'package:san_andres_mobile/presentation/provider/auth_provider.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_provider.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_search_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  final database = AppDatabase(); 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AutopartProvider(),
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AutopartSearchProvider()),
        Provider<AppDatabase>(create: (_) => database),
      ],
      child: const MyApp(),
    ),
  );
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
