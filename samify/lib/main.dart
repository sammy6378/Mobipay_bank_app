import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/theme_provider.dart';
import 'package:samify/screens/sign_in_screen.dart';
import 'package:samify/screens/sign_up_screen.dart';
import 'package:samify/navigation/navigation_menu.dart';
import 'package:samify/screens/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Samify',
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const SplashScreen(),
            routes: {
              '/home-page': (context) => const NavigationMenu(),
              '/sign-in': (context) => const SignInScreen(),
              '/sign-up': (context) => const SignUpScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}