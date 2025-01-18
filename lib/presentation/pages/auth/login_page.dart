import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
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
                height: MediaQuery.of(context).size.height * 0.30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InputDefault(
                      label: "Ingresar su nombre o correo",
                      controller: emailController,
                      icon: Icons.mail,
                      value: emailController.text,
                    ),
                    InputPass(
                      controller: passwordController,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Center(
                  child: Text(
                    'SanAndres@$dateNow',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
