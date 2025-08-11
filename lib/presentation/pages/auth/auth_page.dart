import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/auth_provider.dart';

class AuthPage extends StatefulWidget {
  static String name = "auth_page";
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndRedirect();
  }

  Future<void> _checkAuthAndRedirect() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final verifyFuture = authProvider.initialize();
    final delayFuture = Future.delayed(const Duration(seconds: 3));

    await Future.wait([verifyFuture, delayFuture]);

    if (mounted) {
      final route = authProvider.isAuthenticated ? '/home' : '/auth/login';
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoLoadingAnimation(),
            Text("Verificando . . ."),
          ],
        ),
      ),
    );
  }
}

class LogoLoadingAnimation extends StatefulWidget {
  const LogoLoadingAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogoLoadingAnimationState createState() => _LogoLoadingAnimationState();
}

class _LogoLoadingAnimationState extends State<LogoLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _scaleAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.7), weight: 50),
      ],
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.1416,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value,
              child: CustomPaint(
                painter: _CircleSpinnerPainter(),
                size: Size(
                  MediaQuery.of(context).size.height * 0.50,
                  MediaQuery.of(context).size.height * 0.50,
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                height: MediaQuery.of(context).size.height * 0.13,
                child: Center(
                  child: Image.asset(
                    'assets/icons/logo_recort.png',
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _CircleSpinnerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * 0.85;

    final backgroundPaint = Paint()
      ..color = const Color.fromARGB(66, 170, 9, 9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..shader = const SweepGradient(
        colors: [
          Color.fromARGB(255, 170, 9, 9),
          Color.fromARGB(255, 255, 100, 100),
          Color.fromARGB(255, 170, 9, 9),
        ],
        stops: [0.0, 0.5, 1.0],
        startAngle: 0,
        endAngle: 3.1416,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    const startAngle = -0.5 * 3.1416;
    const sweepAngle = 1.0 * 3.1416;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final dotX = center.dx + radius * cos(startAngle + sweepAngle);
    final dotY = center.dy + radius * sin(startAngle + sweepAngle);

    canvas.drawCircle(Offset(dotX, dotY), 3, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
