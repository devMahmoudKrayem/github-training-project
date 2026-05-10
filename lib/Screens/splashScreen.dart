import 'package:flutter/material.dart';
import '../prefsUser.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );

    scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );

    controller.forward();

    goHome();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> goHome() async {
    await Future.delayed(Duration(seconds: 3));

    final isLoggedIn = await PrefsUser.isLoggedIn();
    final user = await PrefsUser.getUser();
    final hasAccount = (user['email'] ?? '').isNotEmpty;

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/homeScreen');
    } else if (hasAccount) {
      Navigator.pushReplacementNamed(context, '/loginScreen');
    } else {
      Navigator.pushReplacementNamed(context, '/onboardingScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFC554),
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.4),
                        blurRadius: 25,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image(
                    image: AssetImage("images/logo.png"),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Fresh Fruits",
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}