import 'package:flutter/material.dart';
import 'package:social_network/src/features/pages/log_in_screen.dart';
import 'package:social_network/src/features/pages/on_boarding_screen.dart';
import 'package:social_network/src/features/pages/sign_up.dart';
import 'package:social_network/src/routing/app_routes.dart';

import 'src/features/pages/main_screen.dart';
import 'src/features/pages/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => OnBoardingPage(),
        Routes.signIn: (context) => SignInScreen(),
        Routes.signUp: (context) => SignUpScreen(),
        Routes.main: (context) => MainScreen(),
        Routes.profile: (context) => ProfileScreen(),
      },
    );
  }
}



