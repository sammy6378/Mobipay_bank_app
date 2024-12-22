import 'package:flutter/material.dart';
import '../screens/auth/landing_screen.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/home_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landing:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
          settings: settings,
        );
        
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: settings,
        );
      
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );

        case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (_) =>  const HomePage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  // Prevent instantiation
  AppRouter._();
}