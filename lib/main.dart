import 'package:final_project_flutter1/Screens/categoriesScreen.dart';
import 'package:final_project_flutter1/Screens/homeScreen.dart';
import 'package:final_project_flutter1/Screens/loginScreen.dart';
import 'package:final_project_flutter1/Screens/onboarding.dart';
import 'package:final_project_flutter1/Screens/profileScreen.dart';
import 'package:final_project_flutter1/Screens/signUpScreen.dart';
import 'package:final_project_flutter1/Screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/luncherScreen',
      routes: {
        '/luncherScreen': (context)=>SplashScreen(),
        '/onboardingScreen': (context)=>OnboardingScreen(),
        '/singUpScreen': (context)=>SignUpScreen(),
        '/loginScreen': (context)=>LoginScreen(),
        '/homeScreen': (context)=>HomeScreen(),
        '/categoriesScreen': (context)=>CategoriesScreen(),
        '/profileScreen': (context)=>ProfileScreen(),
      },
    );
  }
}
