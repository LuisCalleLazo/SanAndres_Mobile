import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  final void Function() toggleMenu;
  const MenuScreen({super.key, required this.toggleMenu});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.red[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                "Inicio",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                toggleMenu();
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.white),
              title: const Text(
                "Editar informacion de perfil",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                context.push("/home/perfil");
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh, color: Colors.white),
              title: const Text(
                "Forzar actualización de datos",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Acción al presionar
                toggleMenu();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                "Información de la aplicación",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                context.push("/home/help");
              },
            ),
            ListTile(
              leading: const Icon(Icons.precision_manufacturing_rounded, color: Colors.white),
              title: const Text(
                "Gestión de autopartes",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                context.push("/autoparts/manage");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                "Cerrar sesión",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                context.pop();
                toggleMenu();
              },
            ),
          ],
        ),
      ),
    );
  }
}