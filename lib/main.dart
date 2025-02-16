import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_network/src/features/auth/domain/bloc/auth_bloc.dart';
import 'package:social_network/src/features/auth/sign_in/widget/sign_in_screen.dart';
import 'package:social_network/src/features/auth/on_boarding_screen/widget/on_boarding_screen.dart';
import 'package:social_network/src/features/auth/sign_up/widget/sign_up.dart';
import 'package:social_network/src/routing/app_routes.dart';

import 'src/features/main_screen/widget/main_screen.dart';
import 'src/features/profile/widget/profile_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => OnBoardingPage(),
        Routes.signIn: (context) => BlocProvider(
          create: (context) => AuthBloc(),
          child: SignInScreen(),
        ),
        Routes.signUp: (context) => BlocProvider(
          create: (context) => AuthBloc(),
          child: SignUpScreen(),
        ),
        Routes.main: (context) => MainScreen(),
        Routes.profile: (context) => ProfileScreen(),
      },
    );
  }
}



