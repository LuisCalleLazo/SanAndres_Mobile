import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Text(
              "A.S.A",
              textAlign: TextAlign.center,
              style: GoogleFonts.sairaStencilOne(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.red[900]
              ),
            ),
          ),

          // todo: INPUTS de LOGIN
          InputDefault(
            label: "Ingresar su nombre o correo",
            controller: emailController,
            icon: Icons.mail,
            value: emailController.text,
          ),
          const SizedBox(height: 60),
          InputPass(
            controller: passwordController,
          ),
          const SizedBox(height: 90),
          // todo: Boton de Login y de register
          BtnTextDefault(
            text: "Login",
            width: (MediaQuery.of(context).size.width) - 150,
            onPressed: () async {
              context.push('/home');
              // final authContext = Provider.of<AuthProvider>(
              //   context,
              //   listen: false,
              // );
              // await authContext.login(
              //   emailController.text,
              //   passwordController.text,
              //   context,
              // );
            },
          ),
          const SizedBox(height: 20),
          BtnTextDefault(
            text: "Registrarme",
            width: (MediaQuery.of(context).size.width) - 150,
            onPressed: () {
              context.push('/auth/register');
            },
          ),
          const SizedBox(height: 50),
          // Datos de empresa
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
    );
  }
}
