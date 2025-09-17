import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/app_section/app_section.dart';
import 'package:shopping_app/feature/auth/data/repo/repository/auth_repository_impl.dart';
import 'package:shopping_app/feature/auth/presentation/view/login_screen.dart';
import 'package:shopping_app/feature/auth/presentation/view/register_screen.dart';
import 'package:shopping_app/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:shopping_app/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:shopping_app/feature/onboarding/onboarding_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User App",
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => BlocProvider(
          create: (context) => LoginCubit(injectableAuthRepository()),
          child: const LoginScreen(),
        ),
        RegisterScreen.routeName: (context) => BlocProvider(
          create: (context) => RegisterCubit(injectableAuthRepository()),
          child: const RegisterScreen(),
        ),
        AppSection.routeName: (context) => const AppSection(),
      },
    );
  }
}
