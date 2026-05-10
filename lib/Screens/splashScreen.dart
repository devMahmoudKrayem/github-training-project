import 'package:flutter/material.dart';
import '../prefsUser.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goHome();
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
      backgroundColor:Color(0xffFFC554),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image(
              image: AssetImage("images/logo.png"),
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              "Fresh Fruits",
              style: TextStyle(
                fontSize: 42,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}