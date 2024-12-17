import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/common/custom_button.dart';
import '../../navigation/app_routes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo (Icon or Image)
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[700] : Colors.grey[100], // Adjust background color based on theme
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'Welcome to Samify',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87, // Adjust text color based on theme
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Join Samify and listen to all your favorite Music, podcasts and others',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.white70 : Colors.black54, // Adjust text color based on theme
                    ),
                  ),
                  const SizedBox(height: 48),
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.signUp,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black54, // Adjust text color
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.signIn,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
