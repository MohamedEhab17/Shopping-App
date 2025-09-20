import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/common/widget/no_internet_connection_screen.dart';
import 'package:shopping_app/feature/app_section/app_section.dart';
import 'package:shopping_app/feature/auth/data/repo/repository/auth_repository_impl.dart';
import 'package:shopping_app/feature/auth/presentation/view/login_screen.dart';
import 'package:shopping_app/feature/auth/presentation/view/register_screen.dart';
import 'package:shopping_app/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:shopping_app/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:shopping_app/feature/onboarding/onboarding_screen.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppSection.routeName,
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

      builder: (context, child) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            //! check internet
            final results = await Connectivity().checkConnectivity();
            final hasConnection = results.any(
              (r) => r != ConnectivityResult.none,
            );

            if (hasConnection) {
              //! allow pop if has connection
              Navigator.of(context).maybePop();
            }
            //! can't pop if no connection
            if (didPop) return;
          },
          child: Stack(
            children: [
              child!, //! current screen
              StreamBuilder<List<ConnectivityResult>>(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, snapshot) {
                  final results = snapshot.data ?? [];
                  final hasConnection = results.any(
                    (r) => r != ConnectivityResult.none,
                  );
                  //! if no connection show no internet screen (overlay)
                  if (!hasConnection) {
                    return const Positioned.fill(
                      child: NoInternetConnectionScreen(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
