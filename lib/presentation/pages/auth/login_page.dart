import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/auth_provider.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_pass.dart';

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
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Image.asset(
                    'assets/icons/logo_recort.png',
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BtnTextDefault(
                  //   text: "Sign In",
                  //   color: const Color.fromARGB(255, 181, 28, 28),
                  //   heigth: (MediaQuery.of(context).size.height) * 0.05,
                  //   width: (MediaQuery.of(context).size.width) - 80,
                  //   maxWidth: (MediaQuery.of(context).size.width) - 30,
                  //   onPressed: () async {
                  //     context.push('/home');
                  //   },
                  // ),
                  // const SizedBox(height: 10),
                  BtnTextDefault(
                    text: "Iniciar Session",
                    color: const Color.fromARGB(255, 181, 28, 28),
                    heigth: (MediaQuery.of(context).size.height) * 0.05,
                    width: (MediaQuery.of(context).size.width) - 80,
                    maxWidth: (MediaQuery.of(context).size.width) - 30,
                    onPressed: () async {
                    final authContext = Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    );
                    bool login = await authContext.login(
                      _inputManager.getController("email_login").text,
                      _inputManager.getController("passw_login").text,
                      context,
                    );

                    if(login)
                    {
                      // ignore: use_build_context_synchronously
                      context.go('/home/loading');
                    }
                  },
                  ),
                  const SizedBox(height: 10),
                  BtnTextDefault(
                    text: "Registrarme",
                    color: const Color.fromARGB(255, 181, 28, 28),
                    heigth: (MediaQuery.of(context).size.height) * 0.05,
                    width: (MediaQuery.of(context).size.width) - 80,
                    maxWidth: (MediaQuery.of(context).size.width) - 30,
                    onPressed: () {
                      context.push('/auth/register');
                    },
                  ),
                ],
              ),
              Center(
                child: Text(
                  'SanAndres@$dateNow',
                  style: const TextStyle(
                    fontSize: 12,
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
