import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/wave_clipper.dart';
import '../../navigation/app_routes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Here you'll add the Mobipay logo image
                  // Replace the Container with an Image widget once you have the logo
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.payments_outlined,
                      size: 80,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'Welcome to Mobipay',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The fastest and most secure way to transfer money and make payments',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
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
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.black54),
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
          const WaveClipper(),
        ],
      ),
    );
  }
}