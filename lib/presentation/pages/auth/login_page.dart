import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_field_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_pass.dart';
import 'package:san_andres_mobile/shared/constants/default_value.dart';

class LoginPage extends StatefulWidget {
  static String name = "login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final InputControllerManager _inputManager = InputControllerManager();
  final valueManagerInt = ValueNotifierManager<int?>();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String dateNow = now.year.toString();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Text(
                    "A.S.A",
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownFieldDev(
                      items: itemsAppSections,
                      text: "Tipo de servicio",
                      label: "Tipo de servicio",
                      icon: Icons.room_service_rounded,
                      value: valueManagerInt.getNotifier("app_sections"),
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    InputDefault(
                      label: "Ingresar su nombre o correo",
                      controller: _inputManager.getController("email_login"),
                      icon: Icons.mail,
                      value: _inputManager.getController("email_login").text,
                    ),
                    InputPass(
                      controller: _inputManager.getController("passw_login"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnTextDefault(
                      text: "Login",
                      color: const Color.fromARGB(255, 181, 28, 28),
                      width: (MediaQuery.of(context).size.width) - 80,
                      maxWidth: (MediaQuery.of(context).size.width) - 30,
                      onPressed: () async {
                        context.push('/home');
                      },
                    ),
                    BtnTextDefault(
                      text: "Registrarme",
                      color: const Color.fromARGB(255, 181, 28, 28),
                      width: (MediaQuery.of(context).size.width) - 80,
                      maxWidth: (MediaQuery.of(context).size.width) - 30,
                      onPressed: () {
                        context.push('/auth/register');
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'SanAndres@$dateNow',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
