import 'package:flutter/material.dart';

class InputControllerManager {
  // Mapa para almacenar los TextEditingController por nombre
  final Map<String, TextEditingController> _controllers = {};

  // Método para obtener un controlador específico por su nombre
  TextEditingController getController(String name) {
    // Si no existe, crea uno nuevo y lo agrega al mapa
    if (!_controllers.containsKey(name)) {
      _controllers[name] = TextEditingController();
    }
    return _controllers[name]!;
  }

  void setControllerValue(String name, String value) {
    final controller = getController(name);
    controller.text = value;
  }

  // Método para liberar todos los controladores cuando ya no se necesiten
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
  }

  // Método para obtener todos los valores de los inputs en un mapa
  Map<String, String> getAllValues() {
    return _controllers.map((key, controller) => MapEntry(key, controller.text));
  }
}
