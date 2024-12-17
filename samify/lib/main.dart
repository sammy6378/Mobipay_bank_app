import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/auth_provider.dart';
import 'package:samify/providers/theme_provider.dart';
import 'package:samify/screens/auth/sign_in_screen.dart';
import 'package:samify/screens/auth/sign_up_screen.dart';
import 'package:samify/screens/home/home_screen.dart';
import 'package:samify/screens/splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
              '/home-page': (context) => const HomeScreen(),
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