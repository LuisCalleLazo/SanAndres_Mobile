import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/auth_provider.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_pass.dart';

class RegisterPage extends StatefulWidget {
  static String name = "register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final InputControllerManager _inputManager = InputControllerManager();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro como cliente"),
      ),
      body: ListView(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Image.asset(
                'assets/icons/logo_recort.png',
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
          ),
          InputDefault(
            label: "Nombre de usuario",
            controller: _inputManager.getController("name_register"),
            icon: Icons.person,
          ),
          InputDefault(
            label: "Email",
            controller: _inputManager.getController("email_register"),
            icon: Icons.email,
            type: TextInputType.emailAddress,
          ),
          InputDefault(
            label: "Nombre Paterno",
            controller: _inputManager.getController("first_dad_name_register"),
            icon: Icons.person,
          ),
          InputDefault(
            label: "Nombre Materno",
            controller: _inputManager.getController("first_mom_name_register"),
            icon: Icons.person,
          ),
          InputDefault(
            label: "Apellido Paterno",
            controller: _inputManager.getController("last_dad_name_register"),
            icon: Icons.person,
          ),
          InputDefault(
            label: "Apellido Materno",
            controller: _inputManager.getController("last_mom_name_register"),
            icon: Icons.person,
          ),
          InputDefault(
            label: "CI",
            controller: _inputManager.getController("ci_register"),
            icon: Icons.perm_identity,
          ),
          InputDefault(
            label: "Direccion",
            controller: _inputManager.getController("address_register"),
            icon: Icons.place,
          ),
          ListTile(
            title: Text(
              _selectedDate == null
                  ? 'Seleccionar fecha de nacimiento'
                  : 'Fecha: ${_selectedDate!.toLocal()}'.split(' ')[0],
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => _selectDate(context),
          ),
          InputPass(
            controller: _inputManager.getController("pass_register"),
          ),
          const SizedBox(height: 130),
        ],
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BtnTextDefault(
                text: "Registrarse",
                onPressed: () async {
                  if (_selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Por favor selecciona una fecha de nacimiento')),
                    );
                    return;
                  }

                  try {
                    await authProvider.registerUser(
                      name: _inputManager.getController("name_register").text,
                      email: _inputManager.getController("email_register").text,
                      password:
                          _inputManager.getController("pass_register").text,
                      momFirstName: _inputManager
                          .getController("first_mom_name_register")
                          .text,
                      dadFirstName: _inputManager
                          .getController("first_dad_name_register")
                          .text,
                      momLastName: _inputManager
                          .getController("last_mom_name_register")
                          .text,
                      dadLastName: _inputManager
                          .getController("last_dad_name_register")
                          .text,
                      birthDate: _selectedDate!,
                      address:
                          _inputManager.getController("address_register").text,
                      ci: _inputManager.getController("ci_register").text,
                      context: context,
                    );

                    // Navegar al home después del registro exitoso
                    if (context.mounted) {
                      context.push('/home');
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error en el registro: $e')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
